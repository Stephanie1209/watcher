class PullGithubData

  def initialize
    ::Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    service = OrganizationService.new(Rails.application.secrets.github_organization)
    service.creates_or_updates_organization
    @organization = Organization.find_by_github_name(Rails.application.secrets.github_organization)
    # En el arreglo pongo los nombres de los repos que quiera, hago el arreglo de repositories por updatear y en get_repository_data
    # ese arreglo solo tiene los repos que necesito
    @names = ["datoz", "watcher", "tvDashboard"]
    @repositories = []
    puts "AAA"
    @names.each do |name|
      puts "BBBB"
      puts name
      @repositories << @client.org_repositories(@organization.github_name).select{|repo| repo.name == name}.first
      puts "CCCC"
    end
    @repositories
  end

  def get_repository_data
    @repositories.each do |repository|
      commits = @client.commits("#{@organization.github_name}/#{repository["name"]}", { branch: "master", query: { per_page:10000, page: 1 } })

      unless Repository.find_by_name(repository["name"]) && commits.count == Repository.find_by_name(repository["name"]).commits.count
        create_repository(repository["name"])
        @repository = Repository.find_by_name(repository["name"])
        create_issues
        create_pull_requests

        commits.each do |commit|
          commit_service = CommitService.new(@repository.name, "master", commit["sha"])
          commit_service.creates_or_updates_commits
        end
      end
    end
  end

  private

  def fullname
    "#{@organization.github_name}/#{@repository.name}"
  end

  def create_repository(repository_name)
    repository_service = RepositoryService.new(repository_name)
    repository_service.creates_or_updates_repositories
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
