require 'octokit'

class OrganizationService
  attr_reader :organization

  def initialize organization_name
    @organization = nil
    @github_name = organization_name
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_organization_data
    @data = @client.organization @github_name
  end

  def obtains_organization_members
    @data = @client.organization_members @github_name
    @members = []
    @data.each do |organization_data|
      @members << organization_data["login"]
    end
    @members
  end

  def creates_or_updates_organization
    obtains_organization_data
    @organization = Organization.find_by_github_name(@data["login"]) ||
                  Organization.new
    @organization.update(
                        github_name: @data["login"],
                        description: @data["description"],
                        avatar:      @data["avatar_url"]
                        )
  end
end
