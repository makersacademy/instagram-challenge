def sign_up_helper
  visit('/users/sign_up')
  fill_in('user_email', with: 'test@email.com')
  fill_in('user_password', with: 'Testing123')
  fill_in('user_password_confirmation', with: 'Testing123')
  click_button('Sign up')
end

def log_in_helper(email, password)
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_on('Log in')
end
