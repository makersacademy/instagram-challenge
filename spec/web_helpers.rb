require 'rails_helper'

def create_account
  visit('/')
  click_on 'Sign Up'
  fill_in 'user_email', with: 'ana@test.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_on 'Sign up'
end

def log_in
  visit ('/users/sign_in')
  fill_in 'user_email', with: 'ana@test.com'
  fill_in 'user_password', with: 'password'
  click_on 'Log in'
end
