require 'rails_helper'

RSpec.feature "Log out", type: :feature do
  scenario "User can log out of current session" do
    visit "/"
    click_link "SignUp"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    click_link "Log out"

    expect(page).to have_content("Signed out successfully.")
  end
end