require 'rails_helper'

RSpec.describe Admin::PullRequestsController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index, :repository_id => 'watcher'
      expect(response).to render_template :index
    end
  end
end

