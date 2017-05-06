def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in('Email', with: 'pete@pete.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button 'Sign up'
end
