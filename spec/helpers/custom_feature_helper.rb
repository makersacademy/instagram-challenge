require 'rails_helper'

# Create post with no image (only caption)
def create_post
  visit('/posts/')
  click_link 'NEW MOMENT'
  fill_in 'post[caption]', with: 'Test Caption :)'
  click_button 'SHARE MOMENT'
end

# Create post with image and caption
def create_img_post
  visit('/posts/')
  click_link 'NEW MOMENT'
  attach_file("post-img", Rails.root + "spec/features/test.jpg")
  click_button 'SHARE MOMENT'
end

def create_comment
  fill_in 'comment[body]', with: 'Test Comment!'
  click_button 'COMMENT'
end

def sign_up
  visit "/users/sign_up"
  fill_in "user[username]", with: "testUser"
  fill_in "user[email]", with: "example@email.com"
  fill_in "user[password]", with: "password"
  fill_in "user[password_confirmation]", with: "password"
  click_button "Sign up"
end

def sign_up_user_2
  visit "/users/sign_up"
  fill_in "user[username]", with: "testUser2"
  fill_in "user[email]", with: "example2@email.com"
  fill_in "user[password]", with: "password2"
  fill_in "user[password_confirmation]", with: "password2"
  click_button "Sign up"
end

def sign_out
  click_link 'SIGN OUT'
end

def sign_in_with_google_oauth(service = :google_oauth2)
  visit "users/auth/#{service}"
end
