require 'octokit'

class RepositoryService
  attr_reader :repositories, :repo_id

  def initialize repository_id = nil
    @repo_id = repository_id
    @repositories = []
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @organization = Organization.find_by_github_name(Rails.application.secrets.github_organization)
  end

  def obtains_repository_collaborators repository
    collaborators = []
    @data = @client.contribs("#{@organization.github_name}/#{repository.name}")
    @data.each do |collaborator|
      collaborators << collaborator["login"]
    end
    collaborators
  end

  def obtains_repository_data
    @repo_data = []
    if @repo_id.nil?
      @repo_data = @client.org_repos(@organization.github_name,
                              { query: { per_page: 100, page: 1 } })
    else
      @repo_data << @client.repository("#{@organization.github_name}/#{@repo_id}")
      @branches_data = @client.branches("#{@organization.github_name}/#{@repo_id}")
    end
  end

  def creates_or_updates_repositories
    obtains_repository_data
    @repo_data.each do |repo|
      repository = @organization.repositories.find_by_name(repo["name"]) || @organization.repositories.new
      repository.update(
                        name: repo["name"],
                        stars: repo["stargazers_count"],
                        forks_count: repo["forks_count"],
                        started_at: repo["created_at"]
                        )
      @repositories << repository
      if @repo_id
        branch = BranchService.new repo["name"]
        branch.creates_or_updates_branches
      end
    end
  end
end
