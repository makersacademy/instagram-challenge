def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user_email', with: test_email
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

def test_email
  'john@smith.com'
end

def test_password
  '123456'
end
