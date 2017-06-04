require 'rails_helper'

def sign_up(email = "tester@gmail.com")
  visit "/users/sign_up"
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => "password"
  fill_in 'user_password_confirmation', :with => "password"
  click_button 'Sign up'
end

def sign_in(email = "tester@gmail.com")
  visit "/users/sign_in"
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => "password"
  click_button 'Log in'
end

def add_an_image
  visit "/images/new"
  fill_in "image_title", with: "My title"
  fill_in "image_description", with: "My description"
  click_button "Hail!"
end
