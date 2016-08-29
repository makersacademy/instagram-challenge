def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123123'
  fill_in 'Password confirmation', with: '123123'
  click_button 'Sign up'
end
