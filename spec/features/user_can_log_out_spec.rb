require 'rails_helper'

RSpec.feature "Log Out", type: :feature do
  scenario "User can log out after registering" do
    register
    click_link ("Logout")

    expect(page).to have_content("Signed out successfully.")
  end
end
