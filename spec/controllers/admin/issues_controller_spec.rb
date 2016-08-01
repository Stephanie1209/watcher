require 'rails_helper'

RSpec.describe Admin::IssuesController, type: :controller, vcr: true do
  before(:each) do
    @organization = FactoryGirl.create :icalialabs
    @repository =  FactoryGirl.create :watcher, organization: @organization
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "GET #index" do
    before :each do
      get :index, :repository_id => @repository.name
      service = IssueService.new(@repository.name)
      service.creates_or_updates_issue
    end

    it "should render all repository issues" do
      expect(assigns(:issues).count).to eq(36)
    end

    it "renders the :index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the :show view" do
      service = IssueService.new(@repository.name)
      service.creates_or_updates_issue
      get :show, :repository_id => @repository.id, :id => @repository.issues.first.id
      expect(response).to render_template :show
    end
  end

  describe "PUT #update_all" do
    it "has 0 issues when first created" do
      get :index, :repository_id => @repository.name
      expect(@repository.issues.all.count).to eq(0)
    end

    it "has 36 issues after updating" do
      put :update_all, :repository_id => @repository.name
      expect(@repository.issues.all.count).to eq(36)
    end
  end

  describe "PUT #update" do
    before :each do
      @issue = FactoryGirl.create :issue, :github_number => 1, repository: @repository
    end

    it "is not equal to the issue online" do
      expect(@issue.title).to_not eq("Make dashboard columns sorteable ")
    end

    it "is equal to the online issue after updating" do
      put :update, :repository_id => @repository.id, :id => @issue.id
      expect(@issue.reload.title).to eq("Make dashboard columns sorteable ")
    end
  end
end
