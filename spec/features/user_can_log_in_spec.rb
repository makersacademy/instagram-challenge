require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  scenario "User can back log in after logging out" do
    register
    click_link ("Logout")
    click_link ("Log In")
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "smeagol"
    click_button ("Log in")

    expect(page).to have_content("Test User")
  end
end
