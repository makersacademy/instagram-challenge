require 'rails_helper'

feature 'User sign in and out' do
  context 'user not signed in' do
    scenario 'user should see a "sign in" and "sign up" links' do
      visit '/pictures'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'user should not see a "sign out" link' do
      visit '/pictures'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signed in' do
    before do
      user = create :user
      visit '/pictures'
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario 'user should see a "sign out" link' do
      visit '/pictures'
        expect(page).to have_link 'Sign out'
    end

    scenario 'user should not see a "sign in" and "sign up" links' do
      visit '/pictures'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
