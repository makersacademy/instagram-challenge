require 'rails_helper'

feature 'User' do
  context 'A user wants to sign up on the main page' do
    scenario 'user can sign up filling a form' do
      visit '/'
      fill_in 'Nickname', with: 'Jenny'
      fill_in 'email', with: 'jenny@makers.com'
      fill_in 'password', with: '12345'
      fill_in 'password confirmation', with: '12345'
      click_button('Sign up')
      expect(page).to have_button('Sign out')
    end
  end
end
