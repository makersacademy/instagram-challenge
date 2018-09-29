require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/sign_up"
    fill_in "user_username", with: "MyName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end
