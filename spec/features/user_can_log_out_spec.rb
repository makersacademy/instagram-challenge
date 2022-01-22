require 'rails_helper'

RSpec.feature "Log out", type: :feature, js: true do
  scenario "User can log out" do
    user_sign_up
    log_in
    click_link "Log out"
    expect(page).to have_content("Successfully logged out")
    expect(page).to have_current_path("/")
  end
end