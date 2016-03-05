require 'rails_helper'

feature 'User can sign up' do
  context 'User not signed in and on home page' do
    it 'should show the "Sign in" and "Sign up" buttons' do
      visit('/')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Sign in')
    end

    it 'shouldn\'t show the "Sign out" button' do
      visit('/')
      expect(page).not_to have_content('Sign out')
    end

    scenario 'the user signs up to Instagram' do
      sign_up
      expect(page).to have_content('Sign out')
      expect(page).not_to have_content('Sign up')
      expect(page).not_to have_content('Sign in')
    end
  end
end

feature 'User can sign in and out' do
  scenario 'User signs out' do
    sign_up
    sign_out
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Sign in')
  end

  scenario 'User signs in' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_content('Sign out')
  end
end
