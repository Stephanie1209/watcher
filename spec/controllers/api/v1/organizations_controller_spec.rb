require 'spec_helper'

describe Api::V1::OrganizationsController do

  describe "GET #show", :type => :controller do

    let(:id) { "icalialabs" }

    before(:each) do
      get :show, id: id, format: :json
      @github_organization = GithubOrganization.new
      @organization = Organization.new(@github_organization.find(id))
    end

    it "verifies organization is not empty" do
      @organization != nil
    end

    it "returns login, avatar and description of the organization on a hash" do
      expect(@organization.name).to eql("IcaliaLabs")
      expect(@organization.avatar).to eql("https://avatars.githubusercontent.com/u/2523244?v=3")
      expect(@organization.description).to eql("We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.")
    end

    it { should respond_with 200 }
  end
end
