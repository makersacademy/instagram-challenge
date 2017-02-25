require 'rails_helper'

feature 'User' do
  context 'can sign up on the main page' do
    scenario 'user can sign up filling a form' do
      visit '/'
      click_button 'Join Instapic!'
      # fill_in 'nickname', with: 'MakerJenny'
      fill_in 'user_email', with: 'jenny@makers.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button('Sign up')
      expect(page).to have_button('Log out')
      expect(page).not_to have_button('Sign up')
      expect(page).not_to have_button('Log in')
    end

    scenario 'can log out' do
      visit '/'
      click_button 'Join Instapic!'
      # fill_in 'nickname', with: 'MakerJenny'
      fill_in 'user_email', with: 'jenny@makers.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button('Sign up')
      expect(current_path).to eq '/'
      click_button('Log out')
      expect(page).to have_button('Join Instapic!')
      expect(page).to have_button('Log in')
    end
  end
end
