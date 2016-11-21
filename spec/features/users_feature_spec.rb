require 'rails_helper'

feature 'Users can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'should be able to see sign in and sign out link' do
      visit '/'
      expect(page).to have_link 'Sign Up'
      expect(page).to have_link 'Login'
    end

    scenario 'should not be able to see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end
  end

  context 'user signed in on the homepage' do
    scenario 'should see the sign out link, and not see the login or sign up link' do
      sign_in
      expect(page).to have_link 'Sign Out'
      expect(page).not_to have_link 'Sign Up'
      expect(page).not_to have_link 'Login'
    end
  end
end
