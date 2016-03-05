require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'Users can sign in and sign out' do
  context 'users not signed, and on the homepage' do
    scenario 'users should see a sign in link and a sign up link' do
      visit ('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'users should not see a sign out link' do
      visit ('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'users signed in on the homepage' do
    before do
      sign_up_helper
    end

    scenario 'should see a sign-out link' do
      visit ('/')
      expect(page).to have_link('Sign out')
    end

    scenario 'should not see a sign in or sign out link' do
      visit ('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end
end
