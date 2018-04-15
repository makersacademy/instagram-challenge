require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "Signing Up and Signing In", type: :feature do

  scenario "new user signs up" do
    sign_up_test_user
    expect(page).to have_content "Test User"
  end

  scenario "existing user signs in" do
    create_test_user_2
    sign_in_test_user_2
    expect(page).to have_content "Test User 2"
  end

  scenario "signed in user logs out" do
    sign_up_test_user
    click_link "Log Out"
    expect(page).to have_current_path("/welcome")
  end
end
