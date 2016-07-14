require 'rails_helper'

RSpec.describe Api::V1::RepositoriesController, :vcr do

  describe "GET 'index'", type: :controller do
    before(:each) do
      get :index, organization_id: 'icalialabs', format: :json
    end

    it "verifies number of repositories" do
      expect(assigns(:repositories).count).to eq(70)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET 'show'", type: :controller do
    before(:each) do
      get :show, organization_id: 'icalialabs', id: 'furatto', format: :json
    end

    it "verifies repository's id" do
      expect(assigns(:repository).id).to eq(11378510)
    end

    it "verifies repository's name" do
      expect(assigns(:repository).name).to eq("furatto")
    end

    it "verifies repository's description" do
      expect(assigns(:repository).description).to eq("It's a flat, fast and powerful front-end framework for  rapid web development.")
    end

    it "verifies repository's creation date" do
      expect(assigns(:repository).created_at).to eq("2013-07-12T21:32:07.000Z")
    end

    it "verifies repository's updation date" do
      expect(assigns(:repository).updated_at).to eq(nil)
    end

    it "verifies repository's pushed at date" do
      expect(assigns(:repository).pushed_at).to eq("2016-06-12T03:58:44.000Z")
    end

    it "verifies repository's language" do
      expect(assigns(:repository).language).to eq("CSS")
    end


    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
