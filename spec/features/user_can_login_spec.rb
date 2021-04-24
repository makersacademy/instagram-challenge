require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "allows a User to login" do
    visit '/'
    click_link "Login"
    fill_in "Username", with: "CharmingSnail"
    fill_in "Password", with: "Pa55w0rd"
    click_button "Login"
    expect(page).to have_content("You are logged in as CharmingSnail!")
  end
end
