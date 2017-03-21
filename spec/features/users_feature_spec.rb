require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it 'should see a \'sign in\' link and a \'sign up\' link ' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'should not see a \'sign out\' link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
      expect(page).not_to have_content('Welcome')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'should see \'sign out\' link' do
      visit('/')
      expect(page).to have_link('Sign out')
      expect(page).to have_content('Welcome test@example.com')
    end

    it 'should not see a \'sign in \' link and a \'sign up\' link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

feature 'User can edit their profile' do
  context 'User not signed in and on the home page' do

    it 'should not see a \'Edit profile\' link' do
      visit('/')
      expect(page).not_to have_link('Edit profile')
    end

  end

  context 'User signed in and on the home page' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'should see \'Edit profile\' link' do
      visit('/')
      expect(page).to have_link('Edit profile')
    end
    
  end
end
