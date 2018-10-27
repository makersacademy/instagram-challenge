# frozen_string_literal: true

require 'rails_helper'

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in 'user_username', with: 'Casper'
  fill_in 'user_email', with: 'hello@world.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def log_in
  click_on 'Login'
  fill_in 'user_login', with: 'Casper'
  fill_in 'user_email', with: 'hello@world.com'
  fill_in 'user_password', with: '123456'
  click_button 'Log in'
end
