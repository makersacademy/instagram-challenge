require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/sign_up"
    fill_in "username", with: "Lazy"
    fill_in "email", with: "12@23.com"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end