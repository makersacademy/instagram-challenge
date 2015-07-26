require 'rails_helper'

feature 'User can log in and out and sign up' do
  context 'not logged in' do
    scenario 'log out invisible' do
      expect(page).not_to have_link('Log out')
    end

    scenario 'log in and sign up visible' do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end
  end

  context 'logged in' do
    before  do
      visit '/'
      click_link 'Sign up'
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'log out visible' do
      visit('/')
      expect(page).to have_link('Log out')
    end

    scenario 'log in and sign up invisible' do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end