# frozen_string_literal: true

def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "Test"
  fill_in "Username", with: "asdf"
  fill_in "Email", with: "asd@dsa.com"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_button "Sign up"
end

def log_in
  visit "/"
  fill_in "Email", with: "bob@bob.com"
  fill_in "Password", with: "bbbbbb"
  click_button "Log in"
end

def log_in_test
  visit "/"
  fill_in "Email", with: "asd@dsa.com"
  fill_in "Password", with: "123456"
  click_button "Log in"
end
