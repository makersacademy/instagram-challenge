require 'rails_helper'

feature 'User can sign in and out' do

  context 'user not signed in and on the homepage' do
    it 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link('Sign Out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      sign_up
    end

    it 'should see sign out link' do
      visit '/'
      expect(page).to have_link 'Sign Out'
    end

    it 'should not see a sign in link and a sign up link' do
      visit '/'
      expect(page).not_to have_link 'Sign In'
      expect(page).not_to have_link 'Sign Up'
    end
  end
end
