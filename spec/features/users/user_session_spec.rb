require 'rails_helper'

feature 'Signing in a user' do
  background do
    user = create(:user, email: 'test_user_1@test.com', user_name: 'testuser_1')
    visit new_user_session_path
  end

  scenario 'can sign in' do
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

end

feature 'Signing out a user' do
  background do
    user = create(:user, email: 'test_user_1@test.com', user_name: 'testuser_1')
    visit new_user_session_path
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
  end

  scenario 'can sign out' do
    click_link('Sign Out')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end