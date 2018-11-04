require 'rails_helper'

RSpec.feature "Sign Out", type: :feature do
  scenario "User can sign out" do
    user_sign_up

    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Log in")
  end
end
