require 'rails_helper'

RSpec.describe CommitService, vcr: true do

  before :each do
    @organization = FactoryGirl.create :icalialabs
    @repository = FactoryGirl.create :repository, name: 'watcher', organization: @organization
  end
  describe "when commit doesnt exist" do
    describe "receives branch name" do
      before(:each) do
        branch = FactoryGirl.create :dev, repository: @repository
        @service = CommitService.new "watcher", "dev", "6e521ddfc81cb5855cb3cf205af26ab437a14901"
      end
      it "should create a new commit associated to branch name" do
        expect  {
          @service.creates_or_updates_commits
          expect(@service.commit.sha).to eq("6e521ddfc81cb5855cb3cf205af26ab437a14901")
        }.to change(Commit, :count).by(1)
      end

      it "verifies commit-branch association" do
        @service.creates_or_updates_commits
        expect(@service.commit.branch.name).to eq("dev")
      end
    end

    describe "doesnt receive a branch name" do
      before(:each) do
        FactoryGirl.create :branch, name: "master", repository: @repository
        @service = CommitService.new "watcher", nil, "0adae263ce441c4033f23a6d9286ba883c1110da"
      end

      it "should create a new commit" do
        expect  {
          @service.creates_or_updates_commits
          expect(@service.commit.sha).to eq("0adae263ce441c4033f23a6d9286ba883c1110da")
        }.to change(Commit, :count).by(1)
      end

      it "verifies commit-branch association" do
        @service.creates_or_updates_commits
        expect(@service.commit.branch.name).to eq("master")
      end
    end
  end

  describe "when commit already exists" do
    describe "receives branch name" do
      before(:each) do
        branch = FactoryGirl.create :dev, repository: @repository
        @new_commit = FactoryGirl.create :commit, branch: branch, sha: "6e521ddfc81cb5855cb3cf205af26ab437a14901"
        @service = CommitService.new "watcher", "dev", "6e521ddfc81cb5855cb3cf205af26ab437a14901"
      end

      it "should update existing commit" do
        expect  {
          @service.creates_or_updates_commits
          expect(@new_commit.sha).to eq(@service.commit.sha)
        }.to change(Commit, :count).by(0)
      end
    end

    describe "doesnt receive a branch name" do
      before(:each) do
        branch = FactoryGirl.create :branch, name: "master", repository: @repository
        @new_commit = FactoryGirl.create :commit, sha: "0adae263ce441c4033f23a6d9286ba883c1110da"
        @service = CommitService.new "watcher", nil, "0adae263ce441c4033f23a6d9286ba883c1110da"
      end

      it "should update existing commit" do
        expect  {
          @service.creates_or_updates_commits
          expect(@new_commit.sha).to eq(@service.commit.sha)
        }.to change(Commit, :count).by(1)
      end
    end
  end
end
