require 'rails_helper'

RSpec.describe Repository, vcr: true do
  before(:each) do
    VCR.use_cassette  "repository/icalialabs" do
      @repository = Repository.new("furatto")
    end
  end

  it "verifies repository is not empty" do
    @repository.name ==  'furatto'
  end

  it "verifires repository id is " do
    @repository.id == 11378510
  end

  it "verifires forks count" do
    @repository.forks_count == 136
  end

  it "verifies stargazers count" do
    @repository.stargazers == 863
  end

  it "verifies open issues and pull requests count" do
    @repository.open_issues_and_pull_requests_count == 10
  end

  it "verifies open issues" do
    @repository.open_issues.count == 6
  end

  it "verifies open pull requests" do
    @repository.open_pull_requests.count == 4
  end

  it "verifies github_repository" do
    @repository.github_repository == "icalialabs/furatto"
  end
end
