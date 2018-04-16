require 'rails_helper'
RSpec.describe 'Welcome'do
  feature 'user visits home page' do
    scenario 'there is a Welcome page' do
      visit '/'
      expect(page).to have_content('Welcome to my Instagram!')
    end
  end
  feature 'user wants to sign up' do
    scenario 'user clicks Register button' do
      visit '/'
      click_button('Register')
      expect(page).to have_content('Sign up')
    end
  end
  feature 'user wants to log in' do
    scenario 'user clicks Log in button' do
      visit '/'
      click_button('Log in')
      expect(page).to have_content('Email')
    end
  end
end
