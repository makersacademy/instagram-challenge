require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can create an account" do
    visit "/"
    click_link "Sign Up"
    fill_in "user[username]", with: "Test User"
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "smeagol"
    fill_in "user[password_confirmation]", with: "smeagol"
    click_button "Sign up"
    expect(page).to have_content("Test User")
  end

  scenario "User sees an error if registration fails" do
    visit "/"
    click_link "Sign Up"
    fill_in "user[username]", with: "Test User"
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "smeagol"
    fill_in "user[password_confirmation]", with: "wrongpassword"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match")
  end
end
