def signup options={email: 'test@test.com', handle: 'helloworld'}
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: options[:email]
  fill_in 'User handle', with: options[:handle]
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end
