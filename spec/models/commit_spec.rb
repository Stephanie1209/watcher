require 'rails_helper'

RSpec.describe Commit, vcr: true do
  before(:each) do
    @client = GithubData.new.client
    commit_data = @client.commit("icalialabs/watcher", "73862f61dce37853755aabfcd6b819c7e7b70f9e")
    @commit = Commit.new commit_data
  end

  it "verifies commit is initialized" do
    expect(@commit.sha).to eql('73862f61dce37853755aabfcd6b819c7e7b70f9e')
  end

  it "verifies commit's author" do
    expect(@commit.author_name).to eql("mayra-cabrera")
  end

  it "verifies committer's name" do
    expect(@commit.committer_name).to eql("Mayra Cabrera")
  end

  it "verifies commit's message" do
    expect(@commit.message).to eql("Merge pull request #22 from IcaliaLabs/spec_coverage\n\nadds organization and repositories tests. Closes #20")
  end

  it "verifies committer's date" do
    expect(@commit.date.strftime("%Y/%m/%d %H:%M:%S %Z")).to eql("2016/07/12 22:35:33 UTC")
  end

  it "verifies commit's additions" do
    expect(@commit.stats_additions).to eq(74)
  end

  it "verifies commit's deletions" do
    expect(@commit.stats_deletions).to eq(19)
  end

  it "verifies commit's total" do
    expect(@commit.stats_total).to eq(93)
  end
end
