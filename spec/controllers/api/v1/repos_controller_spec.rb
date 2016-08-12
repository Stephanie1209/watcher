require 'rails_helper'

RSpec.describe Api::V1::ReposController, vcr: true do
  before(:each) do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :watcher, organization: @organization
    status = ["open", "closed"]
    @issues = FactoryGirl.create_list :issue, rand(1..10), repository: @repository, status: status.sample
    @pull_requests = FactoryGirl.create_list :pull_request, rand(1..10), repository: @repository, status: status.sample
    @branches = FactoryGirl.create_list :branch, rand(1..10), repository: @repository
  end

  describe "GET#all_issues", type: :controller do
    before(:each) do
      get :all_issues, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open and closed issues" do
      expect(assigns(:issues).count).to eq(@issues.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#open_issues", type: :controller do
    before(:each) do
      get :open_issues, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open issues" do
      expect(assigns(:open_issues).count).to eq(@repository.issues.open.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#closed_issues", type: :controller do
    before(:each) do
      get :closed_issues, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of closed issues" do
      expect(assigns(:closed_issues).count).to eq(@repository.issues.closed.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#all_pull_requests", type: :controller do
    before(:each) do
      get :all_pull_requests, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open and closed pull requests" do
      expect(assigns(:pull_requests).count).to eq(@pull_requests.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#open_pull_requests", type: :controller do
    before(:each) do
      get :open_pull_requests, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open pull requests" do
      expect(assigns(:open_pull_requests).count).to eq(@repository.pull_requests.open.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#closed_pull_requests", type: :controller do
    before(:each) do
      get :closed_pull_requests, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of closed pull requests" do
      expect(assigns(:closed_pull_requests).count).to eq(@repository.pull_requests.closed.count)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#branches", type: :controller do
    before(:each) do
      get :branches, organization_id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of branches" do
      expect(assigns(:branches).count).to eq(@branches.count)
    end

    it "returns the name of the first branch" do
      expect(assigns(:branches).first.name).to eq(@branches.first.name)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
