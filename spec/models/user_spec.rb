require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email, and 8 character password" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it "is invalid without an 8 character or longer password" do
    expect(FactoryGirl.build(:user, password: "123456", password_confirmation: "123456")).to_not be_valid
  end
end
