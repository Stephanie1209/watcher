require 'rails_helper'

RSpec.describe Api::V1::OrganizationsController, :vcr do

  describe "GET #show", type: :controller do
    before(:each) do
      get :show, id: 'icalialabs', format: :json
    end

    it "returns login, avatar and description of the organization" do
      expect(assigns(:organization).name).to eq("IcaliaLabs")
      expect(assigns(:organization).avatar).to eq("https://avatars.githubusercontent.com/u/2523244?v=3")
      expect(assigns(:organization).description).to eq("We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.")
    end

    it "should be succesful", :vcr do
      expect(response).to be_success
    end
  end

  describe "GET#issues_info", type: :controller do
    before(:each) do
      get :issues_info, organization_id: 'icalialabs', format: :json
    end

    it "returns all issues count, open issues count, and closed issues count" do
      expect(assigns(:issues_count)).to eq(321)
      expect(assigns(:open_issues_count)).to eq(78)
      expect(assigns(:closed_issues_count)).to eq(243)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
