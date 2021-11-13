require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'Create Posts' do
    it 'allows user to create a post with a picture' do
      visit root_path
      click_link 'Sign In'
      fill_in(:user_email, with: 'something@example.com')
      fill_in(:user_password, with: 'password')
      click_button
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end

