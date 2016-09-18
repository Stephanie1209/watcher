require 'rails_helper'

RSpec.describe BranchService, vcr: true do

  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :repository, name: 'watcher', organization: @organization
  end

  describe "on multiple branches" do
    describe "when branch doesnt exist" do
      it "should create a new branch" do
        expect  {
            service = BranchService.new "watcher"
            service.creates_or_updates_branches
        }.to change(Branch, :count).by(1)
      end
    end
  end
end
