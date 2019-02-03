def sign_up_steps
  visit '/'
  click_link 'Sign up'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button'Sign up'
end
