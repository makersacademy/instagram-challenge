def sign_up(email: 'test@test.test',
            password: '12345678',
            confirm: '12345678')
  visit('/')
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: confirm
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end

def sign_in(email: 'test@test.test',
            password: '12345678')
  visit('/')
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
