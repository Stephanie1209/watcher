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

  it "verifies commit's message" do
    expect(@commit.message).to eq(nil)
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
