require 'rails_helper'

describe 'sign in functionality' do
  context 'user not signed in, on homepage' do
    it 'appears on the page' do
      visit '/' 
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
      
    scenario 'sign out is not on the page' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in, on the homepage' do
       it 'no longer appears on the page' do
      visit '/' 
      sign_up
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

    scenario 'sign out is not on the page' do
      visit '/'
      sign_up
      expect(page).to have_link 'Sign out'
    end
  end
end
