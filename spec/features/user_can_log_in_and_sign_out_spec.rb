require 'rails_helper'
require 'web_helpers'

RSpec.feature "Sessions", type: :feature do
  scenario "a user signs out", type: :feature do
    sign_up
    click_on("Sign Out")
    expect(page).to have_content("Signed out successfully.")
  end

  scenario "a user logs back in", type: :feature do
    sign_up
    click_on("Sign Out")
    click_on("Log In")
    log_in
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Welcome, Testy")
  end
end
