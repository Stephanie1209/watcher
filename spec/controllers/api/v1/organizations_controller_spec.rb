require 'spec_helper'

describe Api::V1::OrganizationsController do

  describe "GET #show", :type => :controller do

    let(:id) { "icalialabs" }
    before(:each) do
      VCR.use_cassette  "organization/icalialabs" do
        @organization = Organization.new('icalialabs')
        get :show, id: id, format: :json
      end
    end

    it "returns login, avatar and description of the organization on a hash" do
      assigns(:organization).name.should eq(@organization.name)
      assigns(:organization).avatar.should eq(@organization.avatar)
      assigns(:organization).description.should eq(@organization.description)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
