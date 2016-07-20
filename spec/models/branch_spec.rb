require 'rails_helper'

RSpec.describe Branch, vcr: true do

  it "has a valid factory" do
    branch = FactoryGirl.build(:branch)
    expect(branch).to be_valid
  end

  it { should belong_to :repository }

  it { should have_many :commits }

  describe "specific branch" do
    before(:each) do
      @branch = FactoryGirl.create :dev
    end

    it "verifies de name of the branch" do
      expect(@branch.name).to eq("dev")
    end

    it "verifies the sha of the commit"

    it "verifies the url of the commit"
  end
end
