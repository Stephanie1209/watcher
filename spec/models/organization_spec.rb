require 'rails_helper'

RSpec.describe Organization, vcr: true do
  before(:each) do
    VCR.use_cassette  "organization/icalialabs" do
      @client = GithubData.new.client
      organization_data = @client.organization("icalialabs")
      @organization = Organization.new organization_data
    end
  end

  it "verifies organization is not empty" do
    expect(@organization.name).to eql('IcaliaLabs')
  end

  it 'verifies public repos count' do
    expect(@organization.public_repos).to eql(51)
  end

  it 'verifies public and private repos count' do
    expect(@organization.total_repos).to eq(70)
  end

  it 'verifies github html_url' do
    expect(@organization.github_account).to eq('https://github.com/IcaliaLabs')
  end

  it 'verifies avatar url' do
    expect(@organization.avatar).to eq("https://avatars.githubusercontent.com/u/2523244?v=3")
  end

end
