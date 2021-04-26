require 'rails_helper'

RSpec.feature "LogOut", type: :feature do
  scenario "User can log out when logged in" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "Nata11"
    fill_in "Password", with: "Password11"
    fill_in "Password confirmation", with: "Password11"
    click_button "Sign Up"
    click_link "Log Out"
    expect(page).to have_content("Sign Up")
  end
end