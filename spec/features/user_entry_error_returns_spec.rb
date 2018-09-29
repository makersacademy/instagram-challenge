require 'rails_helper'

RSpec.feature "User entry error returns", type: :feature do

  before :each do
    visit "/users/sign_up"
    fill_in "user_username", with: "MyName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    click_link "Sign out"
  end

  scenario "User enters used email" do
    visit "/users/sign_up"
    fill_in "user_username", with: "SecondName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Email has already been taken")
  end

  scenario "User enters different confirmation password" do
    visit "/users/sign_up"
    fill_in "user_username", with: "SecondName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "1234567"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "User enters invalid user name" do
    visit "/"
    click_link "Sign in"
    fill_in "user_login", with: "wrongname"
    fill_in "user_password", with: "123456"
    click_button "Sign in"
    expect(page).to have_content("Invalid Login or password.")
  end

  scenario "User enters invalid password" do
    visit "/"
    click_link "Sign in"
    fill_in "user_login", with: "MyName"
    fill_in "user_password", with: "1234567"
    click_button "Sign in"
    expect(page).to have_content("Invalid Login or password.")
  end
end
