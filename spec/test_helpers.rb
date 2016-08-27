def sign_up
  visit '/'
  click_link 'Sign in'
  fill_in 'email', with: 'example@example.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end
