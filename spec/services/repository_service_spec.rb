require 'rails_helper'

RSpec.describe RepositoryService, vcr: true do
  before :each do
    @organization = FactoryGirl.create :icalialabs
  end

  describe "when a repository doesn't exist" do
    it "should create a new repository" do
      expect  {
          service = RepositoryService.new "IcaliaLabs", "watcher"
          service.creates_or_updates_repository
      }.to change(Repository, :count).by(1)
    end
  end

  describe "when a repository exists" do
    before :each do
      @repository = FactoryGirl.create :repository, name: "Furatto", organization: @organization
    end

    it "does not create an organization" do
      expect {
        service = RepositoryService.new @organization.github_name, @repository.name
        service.creates_or_updates_repository
      }.to change(Repository, :count).by(0)
    end

    it "updates the requested repository" do
      service = RepositoryService.new @organization.github_name, @repository.name
      service.creates_or_updates_repository
      expect(service.updated_repository.id).to eq(@repository.id)
    end
  end
end
