require 'rails_helper'

RSpec.describe Organization, vcr: true do

  it "has a valid factory" do
    organization = FactoryGirl.build(:organization)
    expect(organization).to be_valid
  end

  it { should have_many :repositories }

  describe "specific organization" do
    before(:each) do
      @organization = FactoryGirl.create :icalialabs
    end

    it 'verifies organizations html_url' do
      expect(@organization.github_name).to eq('IcaliaLabs')
    end

    it 'verifies organizations description' do
      expect(@organization.description).to eq('We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.')
    end

    it 'verifies organizations url' do
      expect(@organization.avatar).to eq("https://avatars.githubusercontent.com/u/2523244?v=3")
    end

    it 'verifies public and private repos count'

    it 'verifies github html_url'
  end
end
