require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'user should see a "Sign in" and a "Sign up" link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'user should not see "Sign out" link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    scenario 'user can "Sign in" using facebook' do
      visit('/')
      click_link('Sign in')
      expect(page).to have_link('Sign in with Facebook')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'me@email.com')
      fill_in('Password', with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button('Sign up')
    end

    scenario 'user should see "Sign out" link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario 'user should not see a "Sign in" and a "Sign up" link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
