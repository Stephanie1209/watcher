require 'octokit'

class CommitService
  attr_reader :commit

  def initialize(repository_id, branch_id = nil, sha = nil)
    @commit = nil
    @sha = sha
    @branch_id = branch_id
    @repository = Repository.find_by_name(repository_id)
    @branch = @repository.branches.find_by_name(branch_id || "master")
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_commit_data
    organization = @repository.organization
    fullname = "#{organization.github_name}/#{@repository.name}"
    if @sha
      @data = @client.commit(fullname, @sha)
    else
      @data = @client.commits(fullname, @branch_id)
    end
  end

  def creates_or_updates_commits
    obtains_commit_data
    @data.each do |commit_data|
      @commit = @branch.commits.find_by_sha(commit_data[:sha]) || @branch.commits.new
      @commit.update(
                      sha: commit_data["sha"],
                      author: commit_data["commit"]["author"]["name"],
                      message: commit_data["commit"]["message"],
                      committed_at: commit_data["commit"]["committer"]["date"]
                      )
    end
  end

  def creates_or_updates_commit
    obtains_commit_data
    @commit = @branch.commits.find_by_sha(@sha) || @branch.commits.new
    @commit.update(
                    sha: @data["sha"],
                    author: @data["commit"]["author"]["name"],
                    total: @data["stats"]["total"],
                    message: @data["commit"]["message"],
                    additions: @data["stats"]["additions"],
                    deletions: @data["stats"]["deletions"],
                    committed_at: @data["commit"]["committer"]["date"]
                    )
  end
end
