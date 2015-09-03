def sign_in user
  visit '/'
  click_link 'Sign in'
  fill_in :user_login, with: user.username
  fill_in :user_password, with: user.password
  click_button 'Log in'
end
