require 'rails_helper'

def sign_up(email: 'jonny@mail.com', password: 'password',
            password_confirmation: 'password')
  visit '/'
  click_link 'Sign up', match: :first
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'jonny@mail.com', password: 'password',
            password_confirmation: 'password')
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign up'
end
