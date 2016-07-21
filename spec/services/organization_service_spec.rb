require 'rails_helper'

RSpec.describe OrganizationService, vcr: true do
  describe "when organization doesnt exist" do
    it "should create a new organization" do
      expect  {
          service = OrganizationService.new "IcaliaLabs"
          service.creates_or_updates_organization
          expect(Organization.last.github_name).to eq("IcaliaLabs")
      }.to change(Organization, :count).by(1)
    end
  end

  describe "when organization exists" do
    it "updates an organization" do
      new_org = FactoryGirl.create(:icalialabs, description: "old description")
      service = OrganizationService.new "IcaliaLabs"
      service.creates_or_updates_organization
      expect(Organization.first.description).to eq("We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.")
      expect(service.organization).to eq(new_org)
    end
  end
end
