require 'rails_helper'

RSpec.describe Issue, vcr: true do
  it "has a valid factory" do
    issue = FactoryGirl.build(:issue)
    expect(issue).to be_valid
  end

  it { should belong_to :repository }

  describe "specific issue" do
    before(:each) do
      @issue =  FactoryGirl.create :specific_issue
    end

    it "verifies the id of the issue"

    it "verifies the number of the issue"

    it "verifies the title of the issue" do
      expect(@issue.title).to eq("Add method to search an specific repository")
    end

    it "verifies the description of the issue" do
      expect(@issue.description).to eq("Create the following models")
    end

    it "verifies the assignee if there is one"

    it "verifies the state of the issue" do
      expect(@issue.status).to eq("closed")
    end

    it "verifies issue's labels" do
      expect(@issue.labels).to eq(nil)
    end

    it "verifies the repository name"

    it "verifies the github account" do
      expect(@issue.github_account).to eq("IcaliaLabs")
    end

    it "verifies the github url"
  end

end
