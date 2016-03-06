require 'rails_helper'

feature "User can sign in and out" do
  context "User not signed in" do
    it 'displays a link to allow a user to sign up' do
      visit '/'
      expect(page).to have_link('Sign up')
    end

    it 'displays a link to allow a user to sign in' do
      visit '/'
      expect(page).to have_link('Sign in')
    end

    it 'does not display sign out' do
      visit '/'
      expect(page).not_to have_content('Sign out')
    end
  end

  context "User signed in" do

    before do
      visit '/'
      sign_up
    end

    it 'lets a user a sign out' do
      visit '/'
      click_link 'Sign out'
      expect(page).to have_content('Sign up')
    end

    it 'does not display a link to sign in or up' do
      visit '/'
      expect(page).not_to have_content('Sign in')
      expect(page).not_to have_content('Sign up')
    end
  end
end
