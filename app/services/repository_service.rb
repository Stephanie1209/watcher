require 'octokit'

class RepositoryService
  attr_reader :repository

  def initialize repository_id = nil
    @repo_id = repository_id
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @organization = Organization.find_by_github_name(ENV["github_organization"])
  end

  def obtains_repository_data
    if @repo_id == nil
      @repo_data = @client.org_repos(@organization.github_name,
                              { query: { per_page: 100, page: 1 } })
    else
      @repo_data = @client.repository("#{@organization.github_name}/#{@repo_id}")
      @branches_data = @client.branches("#{@organization.github_name}/#{@repo_id}")
    end
  end

  def creates_or_updates_specific_repository
    obtains_repository_data
    @repository = @organization.repositories.find_by_name(@repo_data["name"]) || @organization.repositories.new
    @repository.update(
                      name: @repo_data["name"],
                      stars: @repo_data["stargazers_count"],
                      forks_count: @repo_data["forks_count"],
                      started_at: @repo_data["created_at"]
                     )
    branch = BranchService.new @repository.name
    branch.creates_or_updates_branches
  end


  def creates_or_updates_repositories
    obtains_repository_data
    @repo_data.each do |repo|
      @repository = @organization.repositories.find_by_name(repo["name"]) || @organization.repositories.new
      @repository.update(
                        name: repo["name"],
                        stars: repo["stargazers_count"],
                        forks_count: repo["forks_count"],
                        started_at: repo["created_at"]
                        )
      branch = BranchService.new repo["name"]
      branch.creates_or_updates_branches
    end

  end
end
