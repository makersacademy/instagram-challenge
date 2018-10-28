# frozen_string_literal: true

def sign_up
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'Username',              with: 'testusername'
  fill_in 'user_email',            with: 'test@test.com'
  fill_in 'Password',              with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end

def log_in
  visit '/users/sign_in'
  fill_in 'Username',              with: 'testusername'
  fill_in 'user_email',            with: 'test@test.com'
  fill_in 'Password',              with: 'testpassword'
  click_button 'Log in'
end

def upload_image
  sign_up
  visit '/'
  click_link 'Add post'
  fill_in 'Title', with: 'test post'
  fill_in 'Body',  with: 'test post'
  attach_file('Image', Rails.root + 'spec/fixtures/logo.jpeg')
  click_button 'Create Post'
end
