require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "allows a User to login" do
    visit '/'
    expect(page).to have_content("You are a Guest, please login")
    click_link "Sign Up"
    fill_in "Username", with: "CharmingSnail"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    click_link "Logout"
    expect(page).to have_content("You are a Guest, please login")
    click_link "Login"
    fill_in "Username", with: "CharmingSnail"
    fill_in "Password", with: "Pa55w0rd"
    click_on "Login"
    expect(page).to have_content("You are logged in as CharmingSnail!")
  end
end
