def sign_up(username:"test", email: 'test@test.com', password: '123456')
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_username', with: username
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign Up'
end

def sign_in
  visit '/'
  click_link 'Sign In'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: '123456'
  click_button 'Sign In'
end

def sign_out
  visit '/'
  click_link 'Sign Out'
end