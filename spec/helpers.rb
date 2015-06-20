def sign_up(email)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end

def sign_in(email)
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  click_button 'Log in'
end