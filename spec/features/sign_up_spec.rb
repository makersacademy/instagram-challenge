require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'User can sign up from index' do
    visit '/'
    fill_in("user_username", with: "testuser")
    fill_in("user_email", with: "test@com")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    click_button("Sign up")
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'User redirected to index if not signed up' do
    visit '/posts'
    expect(page).to have_field("user_username")
    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
    expect(page).to have_button('Sign up')
  end
end
