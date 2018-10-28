# frozen_string_literal: true

def sign_up_helper(email, username, password)
  visit('/')
  click_on('Sign up')
  fill_in :user_email, with: email
  fill_in :user_username, with: username
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  click_on('Sign up')
end

def sign_up_helper_correct
  sign_up_helper("test@test.com", "testname", "password")
end

def make_message(text)
  visit('/')
  click_on('Create post')
  fill_in :message_text, with: text
  find('#message_image').attach_file(Rails.root + 'spec/fixtures/picture.jpeg')
  click_on('Submit')
end
