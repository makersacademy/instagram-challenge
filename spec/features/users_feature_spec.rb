require 'rails_helper'

feature 'users' do
  context 'signed in' do
    before do
      visit '/users/sign_up'
      fill_in 'Username', with: 'MagicalInternationalWoodlouse'
      fill_in 'Email', with: 'fake@fakeemail.com'
      fill_in 'Password', with: 'secretone'
      fill_in 'Password confirmation', with: 'secretone'
      click_button 'Sign up'
    end

    scenario 'signs out' do
      visit '/'
      click_link 'Logout'
    end
  end
end