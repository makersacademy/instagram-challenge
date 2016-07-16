require 'rails_helper'

feature 'Users' do
  context 'when not logged in' do
    scenario 'page shows "Sign in" and "Sign up" links' do
      visit '/'
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    scenario 'page should not show "Sign out" link' do
      visit '/'
      expect(page).not_to have_link "Sign out"
    end
  end

  context 'when logged in' do
    before do
      visit '/'
      click_on 'Sign up'
      fill_in 'user_email', with: 'user1@email.com'
      fill_in 'user_password', with: 'testtest'
      fill_in 'user_password_confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    scenario 'page should not show "Sign in" and "Sign up" links' do
      visit '/'
      expect(page).not_to have_link 'Sign up'
      expect(page).not_to have_link 'Sign in'
    end

    scenario 'page should show "Sign out" link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end
  end


end
