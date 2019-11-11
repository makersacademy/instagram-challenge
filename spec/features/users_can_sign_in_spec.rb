require 'rails_helper'


RSpec.feature "Sign In", type: :feature do

    scenario "Successful sign in" do
      signup_as_new_user('josh')
      click_link "LogOut"
      fill_in "email", with: "josh@gmail.com"
      fill_in "Password", with: "password"
      click_button "Login"
      expect(page).to have_content "Logged in!"
      expect(page).to have_content "josh"
    end
end
