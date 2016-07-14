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
      expect(assigns(:commit).message).to eq("Merge pull request #22 from IcaliaLabs/spec_coverage\n\nadds organization and repositories tests. Closes #20")
      expect(assigns(:commit).stats_additions).to eq(74)
      expect(assigns(:commit).stats_deletions).to eq(19)
      expect(assigns(:commit).stats_total).to eq(93)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET 'index'", type: :controller do

    it "verifies that all commits are recieved for the specified repo" do
      get  'index', organization_id: 'icalialabs', repo_id: 'watcher', format: :json
      expect(assigns(:commits).count).to eq(49)
    end

    it "verifies that all commits are recieved for the specified repo in a range of time" do
      get  'index', organization_id: 'icalialabs', repo_id: 'watcher',
        since: "2016-01-30", until: "2016-06-30", format: :json
      expect(assigns(:commits).count).to eq(22)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
