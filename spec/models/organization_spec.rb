require 'rails_helper'
require 'octokit'

describe Organization do

  before(:each) do
    @organization = Organization.new('icalialabs')
  end

  it "verifies organization is not empty" do
    @organization.name ==  'icalialabs'
  end

  it 'verifies public repos count' do
    @organization.public_repos == '47'
  end

  it 'verifies public and private repos count' do
    @organization.total_repos == '66'
  end

  it 'verifies github html_url' do
    @organization.github_account == 'https://github.com/IcaliaLabs'
  end

  it 'verifies avatar url' do
    @organization.avatar == "https://avatars.githubusercontent.com/u/2523244?v=3"
  end

end
