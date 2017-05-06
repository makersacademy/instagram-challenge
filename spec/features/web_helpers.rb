def sign_up(username: 'axeman',
            email: 'axeman@makers.com',
            password: 'testtest',
            password_confirmation: 'testtest')
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password_confirmation', with: password_confirmation
  click_button 'Sign up'
end
