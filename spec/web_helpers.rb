require 'rails_helper'

def sign_up(email = "dtroi@starfleet.com")
  visit "/users/sign_up"
  fill_in "user_first_name", :with => "Deanna"
  fill_in "user_last_name", :with => "Troi"
  fill_in "user_email", :with => email
  fill_in 'user_password', :with => "password"
  fill_in 'user_password_confirmation', :with => 'password'
  click_button 'Sign Up'
end

def log_in
  visit '/users/sign_in'
  fill_in 'user_email', :with => 'dtroi@starfleet.com'
  fill_in 'user_password', :with => 'password'
  click_button 'Log In'
end

def sign_out(email = 'dtroi@starfleet.com')
  sign_up
  click_link 'Log Out'
end
