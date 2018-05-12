require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "The user can sign up successfully" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@example.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Welcome to Instagram! You have signed up successfully.")
  end
end