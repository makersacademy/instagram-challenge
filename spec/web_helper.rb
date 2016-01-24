def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'test1234'
  fill_in 'Password confirmation', with: 'test1234'
  click_button 'Sign up'
end
