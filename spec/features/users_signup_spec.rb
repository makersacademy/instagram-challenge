require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "invalid signup information" do
    visit signup_path
    fill_in 'Email', with: "user@invalid"
    fill_in 'Name', with: ""
    fill_in 'Username', with: " "
    fill_in 'Password', with: "foo"
    fill_in 'Password Confirmation', with: "bar"
    click_button "Sign Up"

    expect(page).to have_content('Sign up to see photos from your friends.')
  end

  scenario "valid signup information" do
    visit signup_path
    fill_in 'Email', with: "test@test.com"
    fill_in 'Name', with: "Test One"
    fill_in 'Username', with: "testuser1"
    fill_in 'Password', with: "123456"
    fill_in 'Password Confirmation', with: "123456"
    click_button "Sign Up"

    expect(page).to have_content('Test One (@testuser1)')
  end
end
