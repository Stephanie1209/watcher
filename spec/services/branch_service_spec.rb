require 'rails_helper'

RSpec.describe BranchService, vcr: true do

  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :repository, name: 'watcher', organization: @organization
  end

  describe "on single branch" do
    describe "when branch doesnt exist" do
      it "should create a new branch" do
        expect  {
            service = BranchService.new "watcher", "dev"
            service.creates_or_updates_specific_branch
            expect(Branch.last.name).to eq("dev")
        }.to change(Branch, :count).by(1)
      end

      it 'verifies branch-repository association' do
        service = BranchService.new "watcher", "dev"
        service.creates_or_updates_specific_branch
        expect(service.branch.repository).to eq(@repository)
      end
    end

    describe "when branch exists" do
      it "doesnt create a branch" do
        new_branch = FactoryGirl.create :branch, name: 'dev', repository: @repository
        service = BranchService.new "watcher", "dev"
        service.creates_or_updates_specific_branch
        expect(Branch.count).to eq(1)
      end
    end
  end

  describe "on multiple branches" do
    describe "when branch doesnt exist" do
      it "should create a new branch" do
        expect  {
            service = BranchService.new "watcher"
            service.creates_or_updates_branches
        }.to change(Branch, :count).by(5)
      end
    end
  end
end
