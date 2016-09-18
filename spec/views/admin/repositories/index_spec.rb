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
    click_button "Login"
    visit '/admin/repositories'
    click_link "Refresh icon"
    expect(Repository.count).to be(79)
  end
end


