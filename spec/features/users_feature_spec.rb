require 'rails_helper'
require 'user_helper'

include UserSpecHelpers

feature 'User account management' do

  context 'when not signed in and on the homepage' do

    scenario 'the user should see a \'sign in\' and \'sign out\' link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'the user should not see a \'sign out\' link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

  end

  context 'when signed in and on the homepage' do

    before do
      sign_up_and_log_in
    end

    scenario 'the user should see a \'sign out\' link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario 'the user should not see a \'sign in\' or \'sign up\' link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end

end