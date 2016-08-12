require 'rails_helper'

RSpec.describe PullRequest, vcr: true do

  it "has a valid factory" do
    pull_request = FactoryGirl.build(:pull_request)
    expect(pull_request).to be_valid
  end

  it { should belong_to :repository }

  describe "specific pull request" do
    before(:each) do
      @pull_request = FactoryGirl.create :specific_pull
    end

    it "verifies the id of the pull_request"

    it "verifies the number of the pull_request"

    it "verifies the title of the pull_request" do
      expect(@pull_request.title).to eq("Commits api")
    end

    it "verifies the description of the pull_request" do
      expect(@pull_request.description).to eq("Create the following models")
    end

    it "verifies the author of the pull_request"

    it "verifies the assignee if there is one"

    it "verifies the state of the pull_request" do
      expect(@pull_request.status).to eq("closed")
    end

    it "verifies the labels of the pull_request" do
      expect(@pull_request.labels).to eq(nil)
    end

    it "verifies the repository name"

    it "verifies the github account" do
      expect(@pull_request.github_account).to eq("IcaliaLabs")
    end

    it "verifies the github url"
  end
end
