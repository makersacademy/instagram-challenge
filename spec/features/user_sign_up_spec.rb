require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Signup', type: :feature do
  scenario 'User can sign up' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_current_path("/users/sign_up")
    fill_in "user[username]", with: "username123"
    fill_in "user[email]", with: "user@user.com"
    fill_in "user[password]", with: "pword123"
    fill_in "user[password_confirmation]", with: "pword123"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
