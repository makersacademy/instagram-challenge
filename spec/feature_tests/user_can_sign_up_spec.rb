require 'rails_helper'
RSpec.describe "user sign up", :type => :feature do
  feature 'user can sign up' do
    scenario 'user signs up with valid details' do
      user_sign_up('123@gmail.com', '123456', '123456')
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page.current_path).to eq '/'
    end
    scenario 'user signs up with invalid password' do
      user_sign_up('123@gmail.com','123','123')
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
      expect(page.current_path).to eq '/users'
    end
    scenario 'user signs up with invalid email' do
      user_sign_up('123','123','123')
      expect(page).to have_content 'Email is invalid'
      expect(page.current_path).to eq '/users'
    end
    scenario 'user signs up with non matching password' do
      user_sign_up('test@123gmail.com','123456','1234567')
      expect(page).to have_content "Password confirmation doesn't match"
      expect(page.current_path).to eq '/users'
    end
    scenario 'user must provide unique email address' do
      user_sign_up('test@123gmail.com','123456','123456')
      click_link 'Logout'
      user_sign_up('test@123gmail.com','123456','1234567')
      expect(page).to have_content "Email has already been taken"
    end
  end
end
