require 'rails_helper'

RSpec.describe OrganizationService, vcr: true do
  it "creates a new organization" do
    service = OrganizationService.new "IcaliaLabs"
    service.creates_or_updates_organization
    expect(Organization.last.github_name).to eq("IcaliaLabs")
  end

  it "updates an organization" do
    Organization.create(github_name: "IcaliaLabs")
    service = OrganizationService.new "IcaliaLabs"
    service.creates_or_updates_organization
    expect(Organization.last.description).to eq("We guide our clients through an agile process, staying ahead of their competition and leveraging opportunities with digital products.")
  end
end
