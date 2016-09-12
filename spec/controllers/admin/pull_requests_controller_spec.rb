require 'rails_helper'

RSpec.describe Admin::PullRequestsController, type: :controller, vcr: true do
  before(:each) do
    @organization = FactoryGirl.create :icalialabs
    @repository =  FactoryGirl.create :watcher, organization: @organization
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "GET #index" do
    before :each do
      @pull_requests = FactoryGirl.create_list(:pull_request, rand(1..10), repository: @repository)
      get :index, :repository_id => @repository.name
    end

    it "should render all repository issues" do
      expect(assigns(:pull_requests).reverse).to eq(@pull_requests)
    end

    it "renders the :index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the :show view" do
      pull_request = FactoryGirl.create :pull_request, repository: @repository
      get :show, :repository_id => @repository.id, :id => pull_request.id
      expect(response).to render_template :show
    end
  end

  describe "PUT #update_all" do
    it "has 0 pull requests when first created" do
      get :index, :repository_id => @repository.name
      expect(@repository.pull_requests.all.count).to eq(0)
    end

    it "has 36 pull requests after updating" do
      put :update_all, :repository_id => @repository.name
      expect(@repository.pull_requests.all.count).to eq(47)
    end
  end

  describe "PUT #update" do
    before :each do
      @pull_request = FactoryGirl.create :pull_request, :github_number => 71, repository: @repository
    end

    it "is not equal to the issue online" do
      expect(@pull_request.title).to_not eq("WIP Issues/PullRequest Dashboard")
    end

    it "is equal to the online issue after updating" do
      put :update, :repository_id => @repository.name, :id => @pull_request.id
      expect(@pull_request.reload.title).to eq("Issues/PullRequest Dashboard")
    end
  end
end
