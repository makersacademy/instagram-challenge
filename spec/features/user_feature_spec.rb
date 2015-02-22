require 'rails_helper'

feature 'user' do

  context 'user not signed' do

    it 'should display links to sign in or sign up' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    it 'should not show a link to sign out' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

  end

  context 'user signed in' do

    before do
      sign_up('test')
    end

    it 'should show the user their signed in status' do
      expect(page).to have_content('You are signed in as: test@test.com')
    end

    scenario 'should see sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it 'should not see a sign in link or a sign up link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

end
