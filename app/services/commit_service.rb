require 'octokit'

class CommitService
  attr_reader :commit

  def initialize(repository_id, branch_id = nil, sha = nil)
    @commit = nil
    @sha = sha
    @branch_id = branch_id
    @repository = Repository.find_by_name(repository_id)
    @branch = @repository.branches.find_by_name(branch_id || "master")
    ::Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_commit_data
    organization = @repository.organization
    fullname = "#{organization.github_name}/#{@repository.name}"
    @data = []
    if @sha
      @data << @client.commit(fullname, @sha)
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
      if @sha
        @commit.update(
                      total: commit_data["stats"]["total"],
                      additions: commit_data["stats"]["additions"],
                      deletions: commit_data["stats"]["deletions"]
                      )

      end
    end
  end
end
