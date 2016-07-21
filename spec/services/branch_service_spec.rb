require 'rails_helper'

RSpec.describe BranchService, vcr: true do

  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :repository, name: 'watcher', organization: @organization
  end


  describe "when branch doesnt exist" do
    it "should create a new branch" do
      expect  {
          service = BranchService.new "watcher", "dev"
          service.creates_or_updates_branch
          expect(Branch.last.name).to eq("dev")
      }.to change(Branch, :count).by(1)
    end
  end

  describe "when branch exists" do
    it "doesnt create a branch" do
      new_branch = FactoryGirl.create :branch, name: 'dev', repository: @repository
      service = BranchService.new "watcher", "dev"
      service.creates_or_updates_branch
      expect(Branch.count).to eq(1)
    end
  end
end
