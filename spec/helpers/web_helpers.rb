# frozen_string_literal: true

require 'rails_helper'

def create_post
  click_on 'New Post'
  fill_in 'post_description', with: "Cool pic"
  attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
  click_button 'Create Post'
end

def sign_up
  visit '/'
  click_on 'Sign up!'
  fill_in 'user_username', with: 'Casper'
  fill_in 'user_email', with: 'hello@world.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def sign_up2
  visit '/'
  click_on 'Sign up!'
  fill_in 'user_username', with: 'Dumbo'
  fill_in 'user_email', with: 'bye@world.com'
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

def create_comment
  click_on 'Add Comment'
  fill_in 'comment_body', with: 'hello'
  click_button 'Create Comment'
end
