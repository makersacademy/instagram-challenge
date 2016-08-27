def sign_up

  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'nobody@domain.com'
  fill_in 'Password', with: '1234567'
  fill_in 'Password confirmation', with: '1234567'
  click_button 'Sign Up'

end
