require 'rails_helper'
require 'rake'

RSpec.feature 'Sign up', type: :feature do
  context 'User can sign up' do
    scenario 'shows sign-up page with email/password prompt' do
      visit('/')
      expect(page).to have_selector('#user_email')
      expect(page).to have_selector('#user_password')
    end

    scenario 'can sign-up successfully' do
      sign_up_helper
      expect(find('.notice')).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context 'User who hasn\'t signed up yet' do
    scenario 'is redirected to login/signup page if they are not signed up' do
      visit('/images')
      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_selector('#user_email')
      expect(page).to have_selector('#user_password')
  end

    scenario 'sees alert if trying to view /images page + have not signedup' do
      visit('/images')
      expect(page).to have_current_path('/users/sign_in')
      expect(find('.alert')).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
