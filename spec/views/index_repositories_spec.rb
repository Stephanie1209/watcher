require 'rails_helper'

describe "how to get organization repos", :type => :feature, vcr: true do
  before(:each) do
    @user = FactoryGirl.create :user
    FactoryGirl.create :icalialabs
  end

  it 'creates repositories succesfully' do
    visit "/users/sign_in"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "12345678"
    click_button "Log in"
    visit '/admin/repositories'
    click_button "Update"
    expect(Repository.count).to be(71)
  end
end

describe "how to update organization repos", :type => :feature, vcr: true do
  before(:each) do
    @user = FactoryGirl.create :user
    organization = FactoryGirl.create :icalialabs
    FactoryGirl.create :furatto, name: 'furatto', organization: organization
  end

  it 'succesfully updates a single repo' do
    visit "/users/sign_in"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "12345678"
    click_button "Log in"
    visit '/admin/repositories'
    click_link "furatto"
    click_button "Update"
    expect(Repository.count).to be(1)
  end
end
