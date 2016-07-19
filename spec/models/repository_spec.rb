require 'rails_helper'

RSpec.describe Repository, :type => :model, vcr: true do

  it "has a valid factory" do
    repository = FactoryGirl.build(:repository)
    expect(repository).to be_valid
  end

  it { should belong_to :organization }

  describe "specific repository" do
    before(:each) do
      @repository = FactoryGirl.create :furatto
    end

    it "verifies repository is not empty" do
      expect(@repository.name).to  eq('Furatto')
    end

    it "verifires forks count" do
      expect(@repository.forks_count).to eq(136)
    end

    it "verifies stargazers count" do
      expect(@repository.stars).to eq(862)
    end

    it "verifies creation date" do
      expect(@repository.started_at).to eq("2011-01-26 19:01:12.000000000 +0000")
    end

    it "verifires repository id is "

    it "verifies open issues and pull requests count"

    it "verifies open issues"

    it "verifies open pull requests"

    it "verifies github_repository"
  end
end
