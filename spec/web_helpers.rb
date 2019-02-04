def sign_up_steps
  visit '/'
  click_link 'Sign up'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button'Sign up'
end

def new_post_steps
  click_link 'New Post'
  attach_file('Image', "files/images/goldblumdog.jpg")
  fill_in 'Caption', with: 'Goldblum dog'
  click_button 'Create Post'
end

def sign_in_steps
  visit '/'
  click_link 'Sign in'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'test123'
  click_button'Log in'
end
