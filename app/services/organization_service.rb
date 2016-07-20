require 'octokit'

class OrganizationService
  attr_reader :client

  def initialize organization_name
    @github_name = organization_name
    ::Octokit.auto_paginate = true
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def set_organization
    @organization = @client.organization @github_name
  end

  def creates_or_updates_organization
    set_organization
    organization = Organization.find_by_github_name(@organization["login"]) ||
                  Organization.new
    organization.update(
                        github_name: @organization["login"],
                        description: @organization["description"],
                        avatar:      @organization["avatar_url"]
                        )
  end
end
