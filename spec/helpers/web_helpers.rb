def sign_up(email: 'test@example.com', username: 'test')
  visit '/'
  fill_in 'Email', with: email
  fill_in 'Username', with: username
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  click_button 'Sign up'
end
