require 'rails_helper'

RSpec.describe PullRequest, vcr: true do
  before(:each) do
    client = GithubData.new.client
    pull_request_data = client.issue("icalialabs/watcher", "29")
    @pull_request = PullRequest.new pull_request_data
  end

  it "verifies the id of the pull_request" do
    expect(@pull_request.id).to eq(165593569)
  end

  it "verifies the number of the pull_request" do
    expect(@pull_request.number).to  eq(29)
  end

  it "verifies the title of the pull_request" do
    expect(@pull_request.title).to eq("Commits api")
  end

  it "verifies the author of the pull_request" do
    expect(@pull_request.author).to eq("PedroASGarza")
  end

  it "verifies the assignee if there is one" do
    expect(@pull_request.assignee).to eq("mayra-cabrera")
  end

  it "verifies the state of the pull_request" do
    expect(@pull_request.state).to eq("closed")
  end

  it "verifies the repository name" do
    expect(@pull_request.repository_name).to eq("watcher")
  end

  it "verifies the organization name" do
    expect(@pull_request.organization_name).to eq("IcaliaLabs")
  end

  it "verifies the github url" do
    expect(@pull_request.github_url).to eq("https://github.com/IcaliaLabs/watcher/pull/29")
  end
end
