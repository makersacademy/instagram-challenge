require 'rails_helper'

RSpec.feature "User can sign Up", type: :feature do
  scenario "User can post a gram" do
    visit "/"
    click_link "Sign Up"
    fill_in "user_username", with: "test_user"
    fill_in "user_password", with: "test_password"
    click_button "Submit"
    expect(page).to have_content("Welcome test_user to DINOGRAM!")
  end

  scenario "User cannot sign up with a duplicate user name" do
    visit "/"
  end

  scenario "User cannot sign up with empty credentials" do
    visit "/"
  end
end
