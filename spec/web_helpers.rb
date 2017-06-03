require 'rails_helper'

def sign_up
  visit "/users/sign_up"
  email = "test@gmail.com"
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => "password"
  fill_in 'user_password_confirmation', :with => "password"
  click_button 'Sign up'
end

def sign_in
  visit "/users/sign_in"
  email = "test@gmail.com"
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => "password"
  click_button 'Log in'
end
