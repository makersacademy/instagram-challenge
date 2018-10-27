def signup
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_email', with: 'tests@mail.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Sign up'
end

def upload_image
  visit '/image_posts'
  click_link 'New Image Post'
  fill_in 'Caption', with: 'my logo'
  attach_file('Picture', Rails.root + "spec/fixtures/logo.png")
  click_button('Create Image post')
end
