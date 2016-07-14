require 'rails_helper'

RSpec.describe Branch, vcr: true do
  before(:each) do
    client = GithubData.new.client
    branches_data = client.branches("IcaliaLabs/watcher")
    branches = branches_data.map { |data| Branch.new data }
    @branch = branches.first
    binding.pry
  end

  it "verifies de name of the branch" do
    expect(@branch.name).to eq("feat/sortable")
  end

  it "verifies the sha of the commit" do
    expect(@branch.sha).to eq("57a0bcdef17dfc48af8d85976134af9e281ef80c")
  end

  it "verifies the url of the commit" do
    expect(@branch.url).to eq("https://api.github.com/repos/IcaliaLabs/watcher/commits/57a0bcdef17dfc48af8d85976134af9e281ef80c")
  end
end
