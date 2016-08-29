def add_photo
  visit '/'
  click_link 'Add a photo'
  attach_file "photo_image", Rails.root + 'spec/fixtures/files/wham.jpg'
  fill_in :photo_caption, with: 'WHAM!'
  click_button 'Post photo'
end

def user_sign_up
  visit '/'
  click_link 'Create an account'
  fill_in :user_email, with: 'mali@mali.com'
  fill_in :user_password, with: 'secret'
  fill_in :user_password_confirmation, with: 'secret'
  click_button 'Sign up'
end
