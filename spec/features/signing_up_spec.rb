require 'rails_helper'

feature 'User can sign up' do
  context 'visits homepage' do
    it 'should be taken to the log in page' do
      visit '/'
      expect(page).to have_link 'Log In'
      expect(page).to have_link 'Sign Up'
    end

    it 'should not see a Sign Out link' do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end
  end

  context 'user signed in on homepage' do
    before do
      sign_up
    end

    it 'should see a sign out link' do
      visit '/'
      p page
      expect(page).to have_link 'Log Out'
      expect(page).not_to have_link 'Log In'
    end
  end
end