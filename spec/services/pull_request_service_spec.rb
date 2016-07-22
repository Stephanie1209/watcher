require 'rails_helper'

RSpec.describe PullRequestService, vcr: true do
  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :furatto, organization: @organization
  end

  describe "when a pull request doesn't exist" do
    it "creates a pull request" do
      expect {
        service = PullRequestService.new @repository.name, 64
        service.creates_or_updates_pull_request
      }.to change(PullRequest, :count).by(1)
    end
  end

  describe "when a pull request exists" do
    before :each do
      @pull_request = FactoryGirl.create :specific_pull, repository: @repository
    end

    it "does not create a pull request" do
      expect {
        service = PullRequestService.new @repository.name, @pull_request.github_number
        service.creates_or_updates_pull_request
      }.to change(PullRequest, :count).by(0)
    end

    it "updates the requested issue" do
      service = PullRequestService.new @repository.name, @pull_request.github_number
      service.creates_or_updates_pull_request
      expect(service.pull_request.id).to eq(@pull_request.id)
    end
  end
end
