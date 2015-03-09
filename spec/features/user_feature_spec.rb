require 'rails_helper'

feature 'user' do

  context 'user not signed' do

    it 'should display links to sign in or sign up' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Log in')
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
      expect(page).to have_content('You are signed in as: test@example.com')
    end

    it 'should display a sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it 'should not display a sign in link or a sign up link' do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end

  end

  context 'user sign in' do

    before do
      sign_up('test')
    end

    it 'should allow a user to sign in with a previously registered logon' do
      click_link 'Sign out'
      click_link 'Log in'
      fill_in('Email', with: "test@example.com")
      fill_in('Password', with: 'testtest')
      click_button 'Log in'
      expect(page).to have_content('You are signed in as: test@example.com')
    end

  end

  context 'user sign out' do

    before do
      sign_up('test')
    end

    it 'should sign the user out of their session' do
      click_link('Sign out')
      expect(page).to have_content 'Signed out successfully'
      expect(page).to have_link 'Log in'
      expect(page).to have_link 'Sign up'
      expect(page).not_to have_link 'Sign out'
    end


  end

end
