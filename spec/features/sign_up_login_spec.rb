require 'rails_helper'

feature 'Sign up' do
  context 'Fill in sign up form' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'User has signed up and logged in' do
      visit '/'
      expect(page).to have_content('Logged in as test@example.com')
      expect(page).to_not have_content('Sign up')
    end
  end
end
