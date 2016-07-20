require 'octokit'

class OrganizationService
  attr_reader :client

  def initialize organization_name
    ::Octokit.auto_paginate = true
    client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def set_organization
    @organization = client.organization organization_name
  end

  def creates_or_updates_organization
    organization = Organization.find_by_github_name(organization_name) ||
                  Organization.new
    organization.update(github_name: github_name,
                        description: description,
                        avatar: avatar)
  end

  def github_name
    set_organization["login"]
  end

  def description
    set_organization["description"]
  end

  def avatar
    set_organization["avatar_url"]
  end
end
