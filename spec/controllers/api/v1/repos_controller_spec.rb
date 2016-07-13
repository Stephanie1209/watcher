require 'rails_helper'

RSpec.describe Api::V1::ReposController, :vcr do

  describe "GET#all_issues", type: :controller do
    before(:each) do
      get :all_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open and closed issues in watcher(13)" do
      expect(assigns(:issues).count).to eq(13)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#open_issues", type: :controller do
    before(:each) do
      get :open_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of open issues in watcher(3)" do
      expect(assigns(:open_issues).count).to eq(3)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET#closed_issues", type: :controller do
    before(:each) do
      get :closed_issues, id: 'icalialabs', repository_id: 'watcher', format: :json
    end

    it "returns the correct number of closed issues in watcher(10)" do
      expect(assigns(:closed_issues).count).to eq(10)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
