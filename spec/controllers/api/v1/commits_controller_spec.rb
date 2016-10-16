require 'rails_helper'

RSpec.describe Api::V1::CommitsController, :vcr do
  before(:each) do
    @organization = FactoryGirl.create :icalialabs
    @watcher = FactoryGirl.create :watcher, organization: @organization
    @branch = FactoryGirl.create :dev, repository: @watcher
    @commit = FactoryGirl.create :specific_commit, branch: @branch
    FactoryGirl.create_list :commit, rand(10..25), branch: @branch
  end

  describe "GET 'show'", type: :controller do
    before(:each) do
      get  'show', organization_id: 'icalialabs', repo_id: 'watcher',
            sha: "73862f61dce37853755aabfcd6b819c7e7b70f9e", format: :json
    end

    it "verifies that sha" do
      expect(assigns(:commit).sha).to eq("73862f61dce37853755aabfcd6b819c7e7b70f9e")
    end

    it "verifies the author" do
      expect(assigns(:commit).author).to eq("mayra-cabrera")
    end

    it "verifies the additions" do
      expect(assigns(:commit).additions).to eq(74)
    end

    it "verifies the deletions" do
      expect(assigns(:commit).deletions).to eq(19)
    end

    it "verifies the total" do
      expect(assigns(:commit).total).to eq(93)
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end

  describe "GET 'index'", type: :controller do

    it "verifies that all commits are recieved for the specified repo" do
      get  'index', organization_id: 'icalialabs', repo_id: 'watcher', format: :json
      expect(assigns(:commits)).to eq(@branch.commits.count)
    end

    it "verifies that all commits are recieved for the specified repo in a range of time" do
      get  'index', organization_id: 'icalialabs', repo_id: 'watcher',
        since: "2016-01-30", until: "2016-06-30", format: :json
      since = Date.parse("2016-01-30")
      to = Date.parse("2016-06-30")
      expect(assigns(:commits)).to eq(@watcher.commits.between_dates(since, to))
    end

    it "should be succesful" do
      expect(response).to be_success
    end
  end
end
