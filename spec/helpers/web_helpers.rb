def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user_email', with: test_email
  fill_in 'user_username', with: test_username
  fill_in 'user_password', with: test_password
  fill_in 'user_password_confirmation', with: test_password
  click_button 'Sign up'
end

def log_in
  visit '/'
  fill_in 'user_email', with: test_email
  fill_in 'user_password', with: test_password
  click_button 'Log in'
end

def create_post
  visit '/'
  click_link 'New'
  fill_in 'Description', with: 'I can haz rails?'
  attach_file 'post_image', "#{Rails.root}/spec/support/fixtures/test_image.png"
  click_button 'Create post'
end

def test_email
  'john@smith.com'
end

def test_password
  '123456'
end

def test_username
  'JohtSmith2017'
end
