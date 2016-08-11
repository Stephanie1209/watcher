class PullGithubData

  def initialize(repository_name)
    ::Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @organization = Organization.find_by_github_name(Rails.application.secrets.github_organization)
    @repository = @client.repository("#{@organization.github_name}/#{repository_name}")
  end

  def get_repository_data
    create_repository
    create_issues
    create_pull_requests

    branch_service = BranchService.new(@repository.name, "master")
    branch_service.creates_or_updates_branch

    commits = @client.commits(fullname, { branch: "master", query: {per_page:10000, page: 1} })
    commits.each do |commit|
      commit_service = CommitService.new(@repository.name, "master", commit["sha"])
      commit_service.creates_or_updates_commit
    end
  end

  private

  def fullname
    "#{@organization.github_name}/#{@repository.name}"
  end

  def create_repository
    repository_service = RepositoryService.new(@organization.github_name, @repository["name"])
    repository_service.creates_or_updates_repository
  end

  def create_issues
    issue_service = IssueService.new(@repository.name)
    issue_service.creates_or_updates_issue
  end

  def create_pull_requests
    pull_request_service = PullRequestService.new(@repository.name)
    pull_request_service.creates_or_updates_pull_request
  end
end
