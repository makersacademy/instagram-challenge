require 'rails_helper'

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in 'user_email', with: 'chase@ph.com'
  fill_in 'user_password', with: 'chasethecat'
  fill_in 'user_password_confirmation', with: 'chasethecat'
  click_button 'Sign up'
end

def log_in
  visit '/'
  fill_in 'user_email', with: 'chase@ph.com'
  fill_in 'user_password', with: 'chasethecat'
  click_button 'Log in'
end

def post_photo
  allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
  visit '/'
  click_on 'Post Photo'
  fill_in 'photo_title', with: '55 Bar'
  page.attach_file('photo_image', Rails.root + 'app/assets/images/55-bar.jpg')
  click_on 'Upload'
end
