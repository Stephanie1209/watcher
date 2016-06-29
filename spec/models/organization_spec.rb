require 'rails_helper'

describe Organization do

  before(:each) do
    @github_organization = GithubOrganization.new
    @organization = Organization.new(@github_organization.current)
  end

  it "verifies organization is not empty" do
    @organization != nil
  end

end
