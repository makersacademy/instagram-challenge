def sign_up(email: 'test@email.com',
            password: 'test1234',
            password_confirmation: 'test1234')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end
