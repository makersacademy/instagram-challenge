require 'rails_helper'

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in 'user_email', with: 'chase@ph.com'
  fill_in 'user_password', with: 'chasethecat'
  fill_in 'user_password_confirmation', with: 'chasethecat'
  click_button 'Sign up'
end

def log_in
  visit '/'
  fill_in 'user_email', with: 'chase@ph.com'
  fill_in 'user_password', with: 'chasethecat'
  click_button 'Log in'
end
