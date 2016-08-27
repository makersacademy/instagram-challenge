require 'rails_helper'

feature 'user can sign in sign out' do

  context 'on homepage not signed in' do

    scenario 'sees a link "sign in" and a link "sign up"' do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario 'does not see a link "sign out"' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'on home page signed in' do

    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: '1@dot.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
    end

    scenario 'sees a link "Sign out"' do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    scenario 'does not see link "Sign in" or "Sign up"' do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).to_not have_link('Sign up')
    end
  end
end
