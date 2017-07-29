
require "rails_helper"

RSpec.feature "User sign up", type: :feature do

 context "when user not signup or -in" do
    scenario "User can access signup form" do
      visit '/'
      click_on "Sign Up"
      expect(page).to have_content("Sign up form")
    end
  end

  context "when user not signup or -in" do
  scenario "User can signup successfully" do
    visit '/'
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully")
  end
  end

  # return to provide more comp error checks

  scenario "User receives error flash on failed sign up" do
    visit '/'
    sign_up(password_confirmation: "12345")
    expect(page).to have_content("error prohibited this user from being saved")
  end

  context "when already logged in" do

  scenario "User should not see signup or -in on home page" do
    visit '/'
    sign_up
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
  end

end

end
