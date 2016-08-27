require 'rails_helper'

feature 'a new user' do
  context 'when creating an account' do
    scenario 'can create a user name' do
      visit new_user_registration_path
      fill_in 'Email', with: 'tim@test.com'
      fill_in 'User name', with: 'tc'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
      expect(User.count).to eql 1
    end
  end
end
