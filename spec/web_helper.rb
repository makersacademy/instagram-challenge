def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'david@email.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end