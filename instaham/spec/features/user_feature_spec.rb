require 'rails_helper'

def sign_up
  visit '/'
  click_link 'Join in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Join in'
end

feature 'users' do
  context 'sign up, signout, sign in' do
    scenario 'can sign up from homepage' do
      visit '/'
      expect(page).not_to have_content 'post your first pic below!'
      click_link 'Join in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Join in'
      expect(current_path).to eq '/'
      expect(page).to have_content 'Welcome to instaham, post your first pic below!'
      expect(page).not_to have_content 'Join in'
    end

    scenario 'can sign out' do
      sign_up
      expect(current_path).to eq '/'
      expect(page).to have_content 'Welcome to instaham, post your first pic below!'
      click_link 'Sign out'
      expect(page).to have_content 'Thanks for hamming with us, look forward to seeing your ham again soon!'
      expect(page).to have_content 'Join in'
    end

    scenario 'can sign back in' do
      sign_up
      click_link 'Sign out'
      expect(page).to have_content 'Thanks for hamming with us, look forward to seeing your ham again soon!'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Sign in'
      expect(page).to have_content "Welcome back, can't wait to see your new ham!"
      expect(page).to have_content 'Sign out'
    end
  end
end