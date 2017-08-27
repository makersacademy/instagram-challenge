require 'rails_helper'

feature 'User' do
  scenario 'Should see a sign up link' do
    visit '/'
    expect(page).to have_link 'Sign up'
  end

  scenario 'Should see a log in button' do
    visit '/'
    expect(page).to have_button 'Log in'
  end

  scenario 'Should be able to sign up' do
    sign_up
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Should be able to sign out' do
    sign_up
    click_link 'Sign out'
    expect(page).to have_content 'You need to sign in or sign up'
  end

  scenario 'Should be able to log in' do
    sign_up
    click_link 'Sign out'
    log_in
    expect(page).to have_content 'Signed in successfully'
  end
end
