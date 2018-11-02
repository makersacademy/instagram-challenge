require 'rails_helper'

RSpec.feature "Sign Out", type: :feature do
  scenario "User can sign out" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Lazy"
    fill_in "user_email", with: "12@23.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"

    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Log in")
  end
end
