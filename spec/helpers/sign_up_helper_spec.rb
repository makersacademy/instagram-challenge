def sign_up
  visit '/'
  click_link 'Login'
  click_link 'Sign up'
  fill_in 'Username', with: 'satoshi'
  fill_in 'Email', with: 'sam@msn.com'
  fill_in 'Password', with: 'capybara'
  fill_in 'Password confirmation', with: 'capybara'
  click_button 'Sign up'
end
