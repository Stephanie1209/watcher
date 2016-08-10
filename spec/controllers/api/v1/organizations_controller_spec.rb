require 'rails_helper'

RSpec.describe Api::V1::OrganizationsController, :vcr do
  before(:each) do
    @organization = FactoryGirl.create :icalialabs
    @repositories = FactoryGirl.create_list :repository, rand(1..10), organization: @organization
    @issues = FactoryGirl.create_list :issue, rand(25..50), repository: @repositories[rand(0..@repositories.length-1)]
  end

  describe "GET #show", type: :controller do
    before(:each) do
      get :show, id: 'icalialabs', format: :json
    end

    it "returns login, avatar and description of the organization" do
      expect(assigns(:organization).github_name).to eq(@organization.github_name)
    end

    it "returns the avatar of the organization" do
      expect(assigns(:organization).avatar).to eq(@organization.avatar)
    end

    it "returns the description of the organization" do
      expect(assigns(:organization).description).to eq(@organization.description)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET #repositories_info", type: :controller do
    before(:each) do
      get :repositories_info, id: 'icalialabs', format: :json
    end

    it "returns all repos" do
      expect(assigns(:organization).repositories.count).to eq(Repository.count)
    end

    it "returns public repos" do
      expect(assigns(:organization).repositories.is_public.count).to eq(Repository.is_public.count)
    end

    it "returns private repos" do
      expect(assigns(:organization).repositories.is_private.count).to eq(Repository.is_private.count)
      binding.pry
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#issues_info", type: :controller do
    before(:each) do
      get :issues_info, id: 'icalialabs', format: :json
    end

    it "returns all issues count, open issues count, and closed issues count" do
      expect(assigns(:issues_count)).to eq(Issue.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "returns open issues count" do
      expect(assigns(:open_issues_count)).to eq(Issue.open.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "returns closed issues count" do
      expect(assigns(:closed_issues_count)).to eq(Issue.closed.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#pull_requests_info", type: :controller do
    before(:each) do
      get :pull_requests_info, id: 'icalialabs', format: :json
    end

    it "returns all pull requests count, open pull requests count, and closed pull requests count" do
      expect(assigns(:pull_requests_count)).to eq(PullRequest.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "returns open pull requests count" do
      expect(assigns(:open_pull_requests_count)).to eq(PullRequest.open.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "returns closed pull requests count" do
      expect(assigns(:closed_pull_requests_count)).to eq(PullRequest.closed.joins(:repository).where("repositories.organization_id = ?", 1).count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
