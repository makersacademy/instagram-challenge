def sign_up
  visit '/'
  click_link('Sign in')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  find('#user_password_confirmation').set('testtest')
  # fill_in('Password confirmation', with: 'testtest')
  click_button 'Sign up'
end
