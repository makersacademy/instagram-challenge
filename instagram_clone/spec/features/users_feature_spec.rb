require 'rails_helper'

feature "Users" do
  context "sign up" do
    scenario "allows users to register an account" do
      sign_up
      expect(page).to have_content("You have signed up successfully.")
    end
  end
  context "sign in/out" do
    scenario "allows users to sign out" do
      sign_up
      click_link "Sign out"
      expect(page).to have_content("Signed out successfully.")
    end
    scenario "allows users to sign in" do
      sign_up
      click_link "Sign out"
      click_link "Sign in"
      fill_in :user_email, with: "test@test.com"
      fill_in :user_password, with: "password"
      click_button "Log in"
      expect(page).to have_content("Signed in successfully.")
    end
  end
end
