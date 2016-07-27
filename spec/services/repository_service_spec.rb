require 'rails_helper'

RSpec.describe RepositoryService, vcr: true do
  before :each do
    @organization = FactoryGirl.create :icalialabs
  end

  describe "creating or updating specific repository" do
    describe "when a repository doesn't exist" do
      it "should create a new repository" do
        expect  {
          service = RepositoryService.new "watcher"
          service.creates_or_updates_specific_repository
        }.to change(Repository, :count).by(1)
      end
    end

    describe "when a repository exists" do
      before :each do
        @repository = FactoryGirl.create :repository, name: "furatto", organization: @organization
      end

      it "does not create an organization" do
        expect {
          service = RepositoryService.new @repository.name
          service.creates_or_updates_specific_repository
        }.to change(Repository, :count).by(0)
      end

      it "updates the requested repository" do
        service = RepositoryService.new @repository.name
        service.creates_or_updates_specific_repository
        expect(service.repository.id).to eq(@repository.id)
      end
    end
  end

  describe "creating or updating all repositories" do
    describe "when a repository doesn't exist" do
      it "should create a new repository" do
        expect  {
          service = RepositoryService.new
          service.creates_or_updates_repositories
        }.to change(Repository, :count).by(72)
      end
    end
  end
end
