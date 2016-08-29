

def sign_up(email: 'user1@test.com', username: 'user1',
            password: 'testtest',
            password_confirmation: 'testtest')
  visit '/'
  click_on 'Sign up'
  fill_in 'user_email', with: email
  fill_in 'user_username', with: username
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(login: 'user1', password: 'testtest')
  visit '/'
  click_on 'Sign in'
  fill_in 'user_login', with: login
  fill_in 'user_password', with: password
  click_button 'Log in'
end

def post_a_picture(caption: 'testPicture')
  visit '/'
  click_on 'Add a picture'
  fill_in 'Caption', with: caption
  attach_file 'post[image]', 'spec/asset_spec/photos/test_image.PNG'
  click_on 'Create Post'
end
