require 'rails_helper'

RSpec.describe Issue, vcr: true do
  before(:each) do
    client = GithubData.new.client
    issue_data = client.issue("icalialabs/watcher", "21")
    @issue = Issue.new issue_data
  end

  it "verifies the id of the issue" do
    expect(@issue.id).to eq(164737396)
  end

  it "verifies the number of the issue" do
    expect(@issue.number).to  eq(21)
  end

  it "verifies the title of the issue" do
    expect(@issue.title).to eq("Add method to search an specific repository ")
  end

  it "verifies the author of the issue" do
    expect(@issue.author).to eq("mayra-cabrera")
  end

  it "verifies the assignee if there is one" do
    expect(@issue.assignee).to eq("PedroASGarza")
  end

  it "verifies the state of the issue" do
    expect(@issue.state).to eq("open")
  end

  it "verifies the repository name" do
    expect(@issue.repository_name).to eq("watcher")
  end

  it "verifies the organization name" do
    expect(@issue.organization_name).to eq("IcaliaLabs")
  end

  it "verifies the github url" do
    expect(@issue.github_url).to eq("https://github.com/IcaliaLabs/watcher/issues/21")
  end
end
