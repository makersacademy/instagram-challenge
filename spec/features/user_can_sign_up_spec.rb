require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario "allows a User to sign up" do
    visit '/'
    click_link "Sign Up"
    fill_in "Username", with: "CharmingSnail"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Submit"
    expect(page).to have_content("You are logged in as CharmingSnail!")
  end
end
