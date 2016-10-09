require 'rails_helper'

def sign_up
  visit('/users/sign_up')
  fill_in('user_email', with: "er@ce.com")
  fill_in("user_password", with: '123456')
  fill_in("user_password_confirmation", with: '123456')
  click_on('Sign up')
end

def sign_up2
  visit('/users/sign_up')
  fill_in("user_email", with: 'ts@ts.com')
  fill_in("user_password", with: '123456')
  fill_in("user_password_confirmation", with: '123456')
  click_on('Sign up')
end

def login
  visit('/users/sign_in')
  fill_in("user_email", with: 'er@ce.com')
  fill_in("user_password", with: '123456')
  click_on('Log in')
end

def add_photo
  visit('/photo/new')
  fill_in('photo_description', with: "my cat")
  attach_file('photo_image','app/assets/images/sofi.jpg')
  click_on('Add')
end

# def add_comment
