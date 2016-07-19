require 'rails_helper'

RSpec.describe Commit, vcr: true do
  describe "specific commit" do
    before(:each) do
      @commit =  FactoryGirl.create :specific_commit
    end

    it "verifies commit is initialized" do
      expect(@commit.sha).to eql('73862f61dce37853755aabfcd6b819c7e7b70f9e')
    end

    it "verifies commit's author"

    it "verifies committer's name"

    it "verifies commit's message"

    it "verifies committer's date" do
      expect(@commit.committed_at).to eq("2011-01-26 19:01:12.000000000 +0000")
    end

    it "verifies commit's additions" do
      expect(@commit.additions).to eq(74)
    end

    it "verifies commit's deletions" do
      expect(@commit.deletions).to eq(19)
    end

    it "verifies commit's total" do
      expect(@commit.total).to eq(93)
    end
  end

end
