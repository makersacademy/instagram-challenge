require 'rails_helper'
require_relative '../web_helper'

feature 'User can sign in and out' do
  context 'user not signed in on the homepage' do
    scenario 'should see links to sign in and sign up' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'should not see a link to sign out' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in on the homepage' do
    before do
        sign_up
    end

    scenario 'should not see links to sign in and sign up' do
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

    scenario 'should see a link to sign out' do
      expect(page).to have_link 'Sign out'
    end
  end
end
