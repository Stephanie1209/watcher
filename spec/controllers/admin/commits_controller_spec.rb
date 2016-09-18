require 'rails_helper'

RSpec.describe Admin::CommitsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      organization = FactoryGirl.create :icalialabs
      repository =  FactoryGirl.create :watcher, organization: organization
      FactoryGirl.create :branch ,name: "master",repository: repository
      @user = FactoryGirl.create :user
      sign_in @user
    end

    it "renders the :index view" do
      get :index, repository_id: 'watcher', branch_id: 'master'
      expect(response).to render_template :index
    end
  end
end
