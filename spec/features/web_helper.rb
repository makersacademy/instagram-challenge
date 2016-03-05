def sign_up(email = 'test@email.com')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end
