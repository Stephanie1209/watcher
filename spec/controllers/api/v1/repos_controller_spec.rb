require 'rails_helper'

RSpec.describe Api::V1::ReposController, :vcr do

  describe "GET#all_issues", type: :controller do
    before(:each) do
      get :all_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open and closed issues in watcher(17)" do
      expect(assigns(:issues).count).to eq(17)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#open_issues", type: :controller do
    before(:each) do
      get :open_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open issues in watcher(6)" do
      expect(assigns(:open_issues).count).to eq(6)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#closed_issues", type: :controller do
    before(:each) do
      get :closed_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of closed issues in watcher(11)" do
      expect(assigns(:closed_issues).count).to eq(11)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#all_pull_requests", type: :controller do
    before(:each) do
      get :all_pull_requests, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open and closed pull requests in watcher(12)" do
      expect(assigns(:pull_requests).count).to eq(12)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#open_pull_requests", type: :controller do
    before(:each) do
      get :open_pull_requests, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open pull requests in watcher(1)" do
      expect(assigns(:open_pull_requests).count).to eq(1)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#closed_pull_requests", type: :controller do
    before(:each) do
      get :closed_pull_requests, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of closed pull requests in watcher(11)" do
      expect(assigns(:closed_pull_requests).count).to eq(11)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#branches", type: :controller do
    before(:each) do
      get :branches, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of branches in watcher(2)" do
      expect(assigns(:branches).count).to eq(2)
    end

    it "returns the name of the first branch(\"feat/sortable\")" do
      expect(assigns(:branches).first.name).to eq("feat/sortable")
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
