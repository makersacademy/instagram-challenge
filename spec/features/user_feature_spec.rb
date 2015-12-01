require 'rails_helper'

feature 'User' do

  context 'User not signed in' do
    before { visit root_path }
    scenario 'should see the welcome message' do
      within(:css, 'div#header') do
        expect(page).to have_content('Filterspam')
      end
    end
    scenario 'should see the login prompt' do
      expect(page).to have_current_path(user_session_path)
    end
    scenario 'should see the sign up link' do
      expect(page).to have_link('Sign up')
    end
    scenario 'should not see the sign out link' do
      expect(page).to_not have_link('Sign out')
    end
  end

  context 'User signed in' do
    before do
      sign_up_and_sign_in(email: 'user0@users.com', username: 'user0')
    end
    scenario 'should see the welcome message' do
      within(:css, 'div#header') do
        expect(page).to have_content('Filterspam')
      end
    end
    scenario 'should see own username' do
      within(:css, 'div#header') do
        expect(page).to have_content('user0')
      end
    end
    scenario 'should see the sign out link' do
      within(:css, 'div#header') do
        expect(page).to have_link('Sign out')
      end
    end
    scenario 'should not see the sign in or sign up links' do
      expect(page).to_not have_link('Sign in')
      expect(page).to_not have_link('Sign up')
    end
  end

  context 'Invalid sign in' do
    scenario 'Email can not be blank' do
      sign_up_and_sign_in(username: 'username')
      expect(page).to have_current_path(user_registration_path)
      expect(page).to have_content('Email can\'t be blank')
    end
    scenario 'Username can not be blank' do
      sign_up_and_sign_in(email: 'user@users.com')
      expect(page).to have_current_path(user_registration_path)
      expect(page).to have_content('Username can\'t be blank')
    end
    scenario 'Password must be at least 8 characters' do
        visit root_path
        click_link 'Sign up'
        fill_in 'Email', with: 'user@users.com'
        fill_in 'Username', with: 'username'
        fill_in 'Password', with: 'pass'
        fill_in 'Password confirmation', with: 'pass'
        click_button 'Sign up'
        expect(page).to have_current_path(user_registration_path)
        expect(page).to have_content('Password is too short (minimum is 8 characters)')
    end
  end

end
