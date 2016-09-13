require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :controller do
  describe "GET #index" do
    before(:each) do
     @user = FactoryGirl.create :user
     sign_in @user
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end
