# frozen_string_literal: true

def signup
  visit root_path
  click_link 'Sign up'
  fill_in 'Email', with: "alex@mail.com"
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def login
  visit root_path
  click_link 'Login'
  fill_in 'Email', with: "alex@mail.com"
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

def upload_photo
  fill_in "Caption", with: "Love Metal!"
  attach_file("Picture", Rails.root + "spec/fixtures/metal.png")
  click_on "Add Pentapost"
end
