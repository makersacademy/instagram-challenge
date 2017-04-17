require 'rails_helper'
require_relative 'helpers/session_helpers'
include SessionHelpers

feature 'User while on a homepage' do
  context 'and not signed in' do
    it 'can see sign up and sign in links' do
      visit '/pictures'
      expect(page).to have_link "Sign up"
      expect(page).to have_link "Sign in"
    end
    it 'should not see sign out link' do
      expect(page).not_to have_link "Sign out"
    end
    it 'can sign up' do
      sign_up('test@test.com', '11111111', '11111111')
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end
    it 'can sign in' do
      sign_up('test@test.com', '11111111', '11111111')
      click_link 'Sign out'
      sign_in('test@test.com', '11111111')
      expect(page).to have_content 'Signed in successfully'
    end
  end

  context 'and signed in' do
    it 'cannot see sign up and sign in links' do
      expect(page).not_to have_link "Sign up"
      expect(page).not_to have_link "Sign in"
    end
     it 'can see sign out link' do
      sign_up('test@test.com', '11111111', '11111111')
      expect(page).to have_link "Sign out"
    end
     it 'can sign out' do
      sign_up('test@test.com', '11111111', '11111111')
      click_link 'Sign out'
      expect(page).to have_content 'Signed out successfully'
    end
  end
end