require 'rails_helper'

feature 'User can log in and out' do
  context 'user is not logged in and on the homepage' do
    it 'should see a "sign up" link and a "log in" link' do
      visit('/')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Log in')
    end

    it 'should not see a "log out" link' do
      visit('/')
      expect(page).not_to have_link('Log out')
    end
  end

end

# signed in on homepage
# should see sign out link
# should not see sign in and sign up links
