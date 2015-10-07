require 'rails_helper'

def sign_up(user)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password_confirmation
  click_button 'Sign up'
end