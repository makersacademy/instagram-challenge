require 'rails_helper'

RSpec.feature "Sign Out", type: :feature do

  before :each do
    visit "/users/sign_up"
    fill_in "user_username", with: "MyName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
  end

  scenario "User can sign out" do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end
end
