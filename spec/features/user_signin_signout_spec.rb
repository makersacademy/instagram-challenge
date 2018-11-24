require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Authentication', type: :feature do
  scenario 'User can log in' do
    user_sign_up
    user_sign_out
    visit '/'
    click_link 'Login'
    expect(page).to have_current_path("/users/sign_in")
    fill_in "user[email]", with: "user@user.com"
    fill_in "user[password]", with: "pword123"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end

  scenario 'User can log out' do
    user_sign_up
    user_sign_out
    user_sign_in
    expect(page).to have_content("Signed in successfully.")
  end
end
