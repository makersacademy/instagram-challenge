require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'Sign Up' do
    it 'allows user to sign up' do
      visit root_path
      click_link 'Sign Up'
      fill_in(:user_email, with: 'test@example.com')
      fill_in(:user_password, with: 'password123')
      fill_in(:user_password_confirmation, with: 'password123')
      click_button
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end

