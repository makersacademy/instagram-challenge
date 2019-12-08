require 'rails_helper'

RSpec.feature "Signout", type: :feature do
  scenario "User can sign out from the new post page" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Sign up"
    click_on "Sign out"
    expect(page).to have_content("Log in")
  end

  scenario "User can sign out from the view posts page" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Sign up"
    click_link "Sign out"
    visit "/users/sign_in"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    click_on "Log in"
    click_on "Sign out"
    expect(page).to have_content("Log in")
  end

end
