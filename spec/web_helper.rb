require 'rails_helper'

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'laszlo@makers.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button('Sign up')
end

def sign_in
  click_link('Sign in')
  fill_in('Email', with: 'laszlo@makers.com')
  fill_in('Password', with: 'password')
  click_button('Log in')
end

def add_a_picture
  click_link 'Add a picture'
  fill_in 'Name', with: 'My picture'
  fill_in 'Description', with: 'This is a fantastic pic'
  click_button 'Create Picture'
end

def sign_out
  click_link('Sign out')
end
