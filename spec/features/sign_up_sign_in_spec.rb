require 'rails_helper'

RSpec.feature "Signing Up and Signing In", type: :feature do

  scenario "new user signs up" do
    visit "/"
    click_link "Sign Up For !nstagram"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[username]", with: "Test User"
    fill_in "user[password]", with: "testtest"
    fill_in "user[password_confirmation]", with: "testtest"
    click_button "Sign up"
    expect(page).to have_content "Test User"
  end
end
