require 'rails_helper'

RSpec.describe Api::V1::RepositoriesController do
  before(:each) do
    organization = FactoryGirl.create :icalialabs
    @furatto = FactoryGirl.create :furatto, organization: organization
    FactoryGirl.create_list :repository, 10, organization: organization
  end

  describe "GET 'index'", type: :controller do
    before(:each) do
      get :index, organization_id: 'IcaliaLabs', format: :json
    end

    it "verifies number of repositories" do
      expect(assigns(:repositories).count).to eq(11)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET 'show'", type: :controller do
    before(:each) do
      get :show, organization_id: 'IcaliaLabs', id: 'furatto', format: :json
    end

    it "verifies repository's id" do
      expect(assigns(:repository).id).to eq(@furatto.id)
    end

    it "verifies repository's name" do
      expect(assigns(:repository).name).to eq(@furatto.name)
    end

    it "verifies the number of stargazers" do
      expect(assigns(:repository).stars).to eq(@furatto.stars)
    end

    it "verifies repository's creation date" do
      expect(assigns(:repository).started_at).to eq(@furatto.started_at)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
