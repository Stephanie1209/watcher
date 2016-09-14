require 'rails_helper'

RSpec.describe Admin::BranchesController, type: :controller do
  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    it "renders the :index view" do
      get :index, :repository_id => 'watcher'
      expect(response).to render_template :index
    end
  end
end
