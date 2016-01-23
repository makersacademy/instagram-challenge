def sign_in(email, password)
  visit '/'
  click_button 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
