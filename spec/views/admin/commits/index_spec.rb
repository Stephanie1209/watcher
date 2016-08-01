require 'rails_helper'

describe "how to get commits from db", :type => :feature, vcr: true do
  before(:each) do
    @user = FactoryGirl.create :user
    organization = FactoryGirl.create :icalialabs
    FactoryGirl.create :furatto, name: "furatto", organization: organization
    visit "/users/sign_in"
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: "12345678"
    click_button "Log in"
  end

  it 'creates repositories succesfully' do
    visit '/admin/repositories'
    click_link "furatto"
    click_button "Update"
    commit = CommitService.new("furatto", "master")
    commit.creates_or_updates_commits
    click_link "Repositorios"
    click_link "30"
    expect(page).to have_content "aae10817b1dfafbc74e520142714b3680923df96"
  end
end
