require 'rails_helper'

RSpec.feature "User can sign Up", type: :feature do
  scenario "User can post a gram" do
    sign_up
    expect(page).to have_content("Welcome test_user to DINOGRAM!")
  end

  scenario "User cannot sign up with a duplicate user name" do
    sign_up
    click_link "Log Out"
    sign_up
    expect(page).to have_content("Username has already been taken")
  end

  scenario "User cannot sign up with empty credentials" do
    visit "/"
    click_link "Sign Up"
    click_button "Submit"
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end
