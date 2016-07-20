require 'octokit'

class OrganizationService
  attr_reader :client

  def initialize organization_name
    ::Octokit.auto_paginate = true
    client = Octokit::Client.new(access_token: github_token)
    @organization = client.organization organization_name
  end

  def creates_or_updates_organization
    organization = Organization.find_by_github_name(organization_name) ||
                  Organization.new
    organization.update_organization_info(@organization)
  end

  def update_organization_info data
    update(
      github_name: data["login"],
      description: data["description"]
      avatar: data["avatar_url"]
    )
  end
end
