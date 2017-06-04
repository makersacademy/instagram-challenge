require 'rails_helper'

def sign_up(email = 'example@example.com')
  visit '/users/sign_up'
  fill_in 'user_first_name', with: 'Testy'
  fill_in 'user_last_name', with: 'McTestFace'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button 'Sign up'
end

def log_in(email = 'example@example.com')
  visit '/users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

def create_a_post(text)
  click_button "New Post"
  fill_in "Body", with: text
  click_button "Post"
end
