require 'rails_helper'
require 'helpers/users_helper_spec'

feature 'User' do

  include UsersHelper

  context "user not signed in and on the homepage" do
    it 'displays sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'not displays see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up('user@test.com', 'testuser', 'testpassword')
    end

    it 'displays sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'not displays a sign in link and a sign up link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end

  context 'user signed up' do
    before do
      sign_up('user@test.com', 'testuser', 'testpassword')
      click_link 'Sign out'
    end

    it 'can log in using email' do
      sign_in('user@test.com', 'testpassword')
      expect(page).to have_link 'Sign out'
    end

    it 'can log in using username' do
      sign_in('testuser', 'testpassword')
      expect(page).to have_link 'Sign out'
    end
  end

end