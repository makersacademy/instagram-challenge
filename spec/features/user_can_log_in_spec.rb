require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "User can log in" do
    user_sign_up
    visit("/")
    click_link "Log in"
    fill_in "session[email]", with: "kim@kim.com"
    fill_in "session[password]", with: "password"
    click_button "Log in"
    expect(page).to have_content "Logged in as Kim"
  end

  scenario "User cannot log in with invalid credentials" do
    user_sign_up
    visit("/")
    click_link "Log in"
    fill_in "session[email]", with: "kim@kim.com"
    fill_in "session[password]", with: "wrong_password"
    click_button "Log in"
    expect(page).to have_content "Invalid login credentials"
  end
end