require 'rails_helper'

RSpec.describe Api::V1::CommitsController, :vcr do

  describe "GET 'show'", type: :controller do
    before(:each) do
      get  'show', organization_id: 'icalialabs', repo_id: 'watcher',
            sha: "73862f61dce37853755aabfcd6b819c7e7b70f9e", format: :json
    end

    it "verifies that sha, author, message, additions, deletions and total is recieved" do
      expect(assigns(:commit).sha).to eq("73862f61dce37853755aabfcd6b819c7e7b70f9e")
      expect(assigns(:commit).author_name).to eq("mayra-cabrera")
      expect(assigns(:commit).message).to eq(nil)
      expect(assigns(:commit).stats_additions).to eq(74)
      expect(assigns(:commit).stats_deletions).to eq(19)
      expect(assigns(:commit).stats_total).to eq(93)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
