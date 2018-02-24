require 'rails_helper'

describe 'User index page', :type => :feature do
  feature 'displays welcome message' do
    scenario 'when user is logged in' do
      visit '/users/sign_up'
      fill_in 'user[email]', with: 'user@ex.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Sign up'
      expect(page).to have_content 'Hello, user'
    end
  end
end
