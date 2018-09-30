require 'rails_helper'

RSpec.feature "Sign In", type: :feature do

  scenario "User can sign in" do
    visit "/users/sign_up"
    fill_in "username", with: "Lazy"
    fill_in "email", with: "12@23.com"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button "Sign up"
    click_link "Sign out"

    visit "/"
    click_link "Sign In"
    fill_in "email", with: "12@23.com"
    fill_in "password", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end