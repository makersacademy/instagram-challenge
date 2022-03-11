require 'rails_helper'

RSpec.feature "Log out", type: :feature do
  scenario "user can log out and stay logged out" do
    log_in
    expect(page).to have_link "Log Out"
    click_link "Log Out"
    expect(page).to have_button "Log In"
    visit '/'
    expect(page).to have_content "Sign Up"
  end
end
