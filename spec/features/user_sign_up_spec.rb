require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "Can sign up" do
    visit "/posts"
    click_link "Sign up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
