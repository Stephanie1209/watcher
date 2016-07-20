require 'octokit'

class RepositoryService
  def initialize organization_id, repository_id
    @org_id = organization_id
    @repo_id = repository_id
    ::Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @organization = Organization.find_by_github_name(organization_id)
  end

  def obtains_repository_data
    @data = @client.repository("#{@org_id}/#{@repo_id}")
  end

  def creates_or_updates_repository
    obtains_repository_data
    repository = @organization.repositories.find_by_name(@data["name"]) || @organization.repositories.new

    repository.update(
                      name: @data["name"],
                      stars: @data["stargazers_count"],
                      forks_count: @data["forks_count"],
                      started_at: @data["created_at"],
                     )
  end
end
