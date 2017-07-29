
require "rails_helper"

RSpec.feature "User sign up", type: :feature do
    scenario "User can access signup form" do
      visit '/'
      click_on "Sign Up"
      expect(page).to have_content("Sign up form")
  end
  scenario "User can signup successfully" do
    visit '/'
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully")
  end

  # return to provide more comp error checks

  scenario "User receives error flash on failed sign up" do
    visit '/'
    sign_up(password_confirmation: "12345")
    expect(page).to have_content("error prohibited this user from being saved")
  end

  scenario "Registered user tries to signup again" do
    visit '/'
    sign_up
    click_on "Sign Up"
    expect(page).to have_content("You are already signed in")
  end

end
