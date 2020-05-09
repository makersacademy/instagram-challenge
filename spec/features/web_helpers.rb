def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'ben@test.com'
  fill_in 'Password', with: 'password1'
  fill_in 'Password confirmation', with: 'password1'
  click_button 'Sign up'
end