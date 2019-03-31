require 'rails_helper'
require 'features_helper'

feature 'Authentication:' do
  
  scenario 'can sign-up for an account' do
    sign_up_for_an_account
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  scenario 'can sign-in with a valid account' do
    sign_up_for_an_account
    log_out
    visit '/users/sign_in'
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'can sign-out of an account when signed-in' do
    sign_up_for_an_account
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'cannot see Sign out link if logged-out' do
    visit '/'
    expect(page).not_to have_content 'Sign out'
  end

  scenario 'cannot see sign-in/up links if logged-in' do
    sign_up_for_an_account
    visit '/'
    expect(page).not_to have_link 'Sign-up'
    expect(page).not_to have_link 'Sign-in'
  end
end