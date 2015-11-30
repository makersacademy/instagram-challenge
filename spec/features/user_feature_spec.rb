require 'rails_helper'

feature 'User can sign in and out' do

  context 'User not signed in' do
    before { visit '/' }
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
      sign_up_and_sign_in(email: 'user0@users.com')
    end
    scenario 'should see the welcome message' do
      within(:css, 'div#header') do
        expect(page).to have_content('Filterspam')
      end
    end
    scenario 'should see own username' do
      within(:css, 'div#header') do
        expect(page).to have_content('user0@users.com')
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

end
