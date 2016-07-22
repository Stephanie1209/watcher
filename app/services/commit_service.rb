require 'octokit'

class CommitService
  attr_reader :commit

  def initialize(repository_id, branch_id = nil, sha)
    @commit = nil
    @sha = sha
    @repository = Repository.find_by_name(repository_id)
    @branch = @repository.branches.find_by_name(branch_id || "master")
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_commit_data
    organization = @repository.organization
    fullname = "#{organization.github_name}/#{@repository.name}"
    @data = @client.commit(fullname, @sha)
  end

  def creates_or_updates_commit
    obtains_commit_data
    @commit = @branch.commits.find_by_sha(@sha) || @branch.commits.new
    @commit.update(
                    sha: @data["sha"],
                    total: @data["stats"]["total"],
                    message: @data["commit"]["message"],
                    additions: @data["stats"]["additions"],
                    deletions: @data["stats"]["deletions"],
                    committed_at: @data["commit"]["committer"]["date"]
                    )
  end
end
