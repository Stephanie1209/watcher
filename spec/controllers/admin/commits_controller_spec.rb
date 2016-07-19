require 'rails_helper'

RSpec.describe Admin::CommitsController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index, :branch_id => 'watcher'
      expect(response).to render_template :index
    end
  end
end
