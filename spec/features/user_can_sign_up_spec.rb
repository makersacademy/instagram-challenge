require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Users can sign up and are directed to the right page" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"

    click_on "Sign up" #syntax problem
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
