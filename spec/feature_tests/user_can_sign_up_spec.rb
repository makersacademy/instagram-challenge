require 'rails_helper'
RSpec.describe "user sign up", :type => :feature do
  feature 'user can sign up' do
    scenario 'user signs up with valid details' do
      visit '/users/sign_up'
      fill_in 'user[email]', with: '123@gmail.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page.current_path).to eq '/'
    end
    scenario 'user signs up with invalid password' do
      visit '/users/sign_up'
      fill_in 'user[email]', with: '123@gmail.com'
      fill_in 'user[password]', with: '123'
      fill_in 'user[password_confirmation]', with: '123'
      click_button 'Sign up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
      expect(page.current_path).to eq '/users'
    end
    scenario 'user signs up with invalid email' do
      visit '/users/sign_up'
      fill_in 'user[email]', with: '123'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'Sign up'
      expect(page).to have_content 'Email is invalid'
      expect(page.current_path).to eq '/users'
    end
    scenario 'user signs up with non matching password' do
      visit '/users/sign_up'
      fill_in 'user[email]', with: '123@gmail.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '1234567'
      click_button 'Sign up'
      expect(page).to have_content "Password confirmation doesn't match"
      expect(page.current_path).to eq '/users'
    end
  end
end
