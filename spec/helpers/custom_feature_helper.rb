require 'rails_helper'

def create_post
  visit('/posts/')
  click_link 'NEW MOMENT'
  fill_in 'post[caption]', with: 'Test Caption :)'
  click_button 'SHARE MOMENT'
end

def sign_up
  visit "/users/sign_up"
  fill_in "user[username]", with: "testUser"
  fill_in "user[email]", with: "example@email.com"
  fill_in "user[password]", with: "password"
  fill_in "user[password_confirmation]", with: "password"
  click_button "Sign up"
end
