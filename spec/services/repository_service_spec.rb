require 'rails_helper'

RSpec.describe RepositoryService, vcr: true do
  before :each do
    FactoryGirl.create :icalialabs
  end

  describe "when a repository doesn't exist" do
    it "should create a new repository" do
      expect  {
          service = RepositoryService.new "IcaliaLabs", "watcher"
          service.creates_or_updates_repository
          expect(Repository.last.name).to eq("watcher")
      }.to change(Repository, :count).by(1)
    end
  end

  describe "when a repository exists" do
    it "updates the repository" do
      FactoryGirl.create :furatto
      expect {
        service = RepositoryService.new "IcaliaLabs", "furatto"
        service.creates_or_updates_repository
        expect(Repository.first.name).to eq("Furatto")
      }.to change(Repository, :count).by(1)
    end
  end
end
