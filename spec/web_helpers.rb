require 'rails_helper'

def sign_up(email = "example@starfleet.com")
  visit "/users/sign_up"
  fill_in "user_email", :with => email
  fill_in 'user_password', :with => "password"
  fill_in 'user_password_confirmation', :with => 'password'
  click_button 'Sign Up'
end

def log_in(email = "example@starfleet.com")
  visit '/users/sign_in'
  fill_in 'user_email', :with => 'example@starfleet.com'
  fill_in 'user_password', :with => 'password'
  click_button 'Log In'
end
