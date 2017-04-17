require 'rails_helper'

feature 'user signing in and out' do
  context 'logged out; on homepage' do
    scenario 'displays "Sign in" and "Sign up" link' do
      visit '/photos'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'does not display "Sign out" link' do
      visit '/photos'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'logged in; on homepage' do
    before do
      user = build :user
      sign_up user
    end

    scenario 'displays "Sign out" link' do
      expect(page).to have_link 'Sign out'
    end

    scenario 'does not display "Sign in" link and "Sign up" link' do
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end

def sign_up user
  visit '/photos'
  click_link 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password_confirmation
  click_button 'Sign up'
end
