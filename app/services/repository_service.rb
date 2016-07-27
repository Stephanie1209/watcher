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
      @data = @client.org_repos(@organization.github_name,
                              { query: { per_page: 100, page: 1 } })
    else
      @data = @client.repository("#{@organization.github_name}/#{@repo_id}")
    end
  end

  def creates_or_updates_specific_repository
    obtains_repository_data
    @repository = @organization.repositories.find_by_name(@data["name"]) || @organization.repositories.new
    @repository.update(
                      name: @data["name"],
                      stars: @data["stargazers_count"],
                      forks_count: @data["forks_count"],
                      started_at: @data["created_at"]
                     )
  end


  def creates_or_updates_repositories
    obtains_repository_data
    @data.each do |repo|
      @repository = @organization.repositories.find_by_name(repo["name"]) || @organization.repositories.new
      @repository.update(
                        name: repo["name"],
                        stars: repo["stargazers_count"],
                        forks_count: repo["forks_count"],
                        started_at: repo["created_at"]
                        )
    end
  end
end
