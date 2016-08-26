def sign_up(email: 'test@test.com', username: 'someuser', password: 'password')
  visit '/users/sign_up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_in(email: 'test@test.com', password: 'password')
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

def sign_out
  click_link 'Sign out'
end
