require 'rails_helper'

feature 'user can sign in and out' do
  context 'user not signed in and on homepage'
    scenario 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'it should not see sign out' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    context 'user signed in on the home page' do
      before do
        sign_up
      end

      scenario 'user can log-out' do
        expect(page).to have_link 'Sign out'

      end

      scenario 'can not sign in or up' do
        expect(page).not_to have_link 'Sign up'
        expect(page).not_to have_link 'Sign in'
      end

  end
end
