require 'rails_helper'

RSpec.describe IssueService, vcr: true do
  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :furatto, organization: @organization
  end

  describe "when an issue doesn't exist" do
    it "creates an issue" do
      expect {
        service = IssueService.new @repository.name, 1
        service.creates_or_updates_issue
      }.to change(Issue, :count).by(1)
    end
  end

  describe "when an issue exists" do
    before :each do
      @issue = FactoryGirl.create :specific_issue, repository: @repository
    end

    it "does not create an issue" do
      expect {
        service = IssueService.new @repository.name, @issue.github_number
        service.creates_or_updates_issue
      }.to change(Issue, :count).by(0)
    end

    it "updates the requested issue" do
      service = IssueService.new @repository.name, @issue.github_number
      service.creates_or_updates_issue
      expect(service.issue.id).to eq(@issue.id)
    end
  end
end

