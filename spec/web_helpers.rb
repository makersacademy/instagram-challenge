# frozen_string_literal: true

def signup
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_email', with: 'tests@mail.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Sign up'
end

def upload_image
  click_link 'New Gram'
  fill_in 'Caption', with: 'Easy Peasy'
  attach_file('Image', Rails.root + 'spec/fixtures/files/easy_peasy.jpg')
  click_button 'Create Gram'
  visit '/grams'
end
