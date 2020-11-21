require 'rails_helper'
require 'web_helpers'
RSpec.feature "Sign in", type: :feature do
  scenario "Can sign in" do
    add_new_user
    expect(page).to have_content("test@testing.com")
    click_on('Sign out')
    expect(page).to have_content("Welcome, stranger")
    click_on('Sign in')
    fill_in('user_email', with: "test@testing.com")
    fill_in('user_password', with: '123456')
    click_on('Log in')
    expect(page).to have_content("test@testing.com")
  end
end