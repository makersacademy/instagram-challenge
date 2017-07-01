require 'rails_helper'

feature 'user can sign in and sign out' do
  context 'user not signed in' do
    it 'should see the sign in link' do
      visit '/'
      expect(page).to have_button 'Log in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see the link sign out' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end
end
