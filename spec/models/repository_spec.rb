require 'rails_helper'

RSpec.describe Repository, vcr: true do
  before(:each) do
    VCR.use_cassette  "repository/icalialabs" do
      @client = GithubData.new.client
      repo_data = @client.repo("icalialabs/furatto")
      issues = @client.list_issues("icalialabs/furatto")
      @repository = Repository.new(repo_data, issues)
    end
  end

  it "verifies repository is not empty" do
    expect(@repository.name).to  eq('furatto')
  end

  it "verifires repository id is " do
    expect(@repository.id).to eq(11378510)
  end

  it "verifires forks count" do
    expect(@repository.forks_count).to eq(136)
  end

  it "verifies stargazers count" do
    expect(@repository.stargazers).to eq(863)
  end

  it "verifies open issues and pull requests count" do
    expect(@repository.open_issues_and_pull_requests_count).to eq(10)
  end

  it "verifies open issues" do
    expect(@repository.open_issues.count).to eql(6)
  end

  it "verifies open pull requests" do
    expect(@repository.open_pull_requests.count).to eql(4)
  end

  it "verifies github_repository" do
    expect(@repository.github_repository).to eql("IcaliaLabs/furatto")
  end
end
