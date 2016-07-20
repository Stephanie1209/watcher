require 'rails_helper'

RSpec.describe Admin::CommitsController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index, :repository_id => 'watcher', :branch_id => 'master'
      expect(response).to render_template :index
    end
  end
end
