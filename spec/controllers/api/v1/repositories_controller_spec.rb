require 'rails_helper'

RSpec.describe Api::V1::RepositoriesController do

  describe "GET 'index'", type: :controller do
    before(:each) do
      get :index, organization_id: 'icalialabs', format: :json
    end

    it "verifies number of repositories", :vcr do
      expect(assigns(:repositories).count).to eq(70)
    end

    it "should be succesful", :vcr do
      expect(response).to be_success
    end
  end
end
