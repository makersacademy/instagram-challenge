require 'rails_helper'

feature 'Users' do

  let!(:user1) {
    User.create(email: 'user1@test.com', username: 'user1',
                password: 'testtest',
                password_confirmation: 'testtest')
  }

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

    scenario 'can log in with email' do
      visit '/'
      click_on 'Sign in'
      fill_in 'user_login', with: 'user1@test.com'
      fill_in 'user_password', with: 'testtest'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end

    scenario 'can log in with username' do
      visit '/'
      click_on 'Sign in'
      fill_in 'user_login', with: 'user1'
      fill_in 'user_password', with: 'testtest'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end

  context 'when logged in' do
    before do
      visit '/'
      click_on 'Sign in'
      fill_in 'user_login', with: 'user1'
      fill_in 'user_password', with: 'testtest'
      click_button 'Log in'
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
