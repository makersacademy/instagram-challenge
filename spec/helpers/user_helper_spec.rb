def sign_up(email: 'camilla@email.com', password: 'pass1234')
  click_link 'Sign up'
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button 'Sign up'
end

def log_in(email: 'camilla@email.com', password: 'pass1234')
  click_link 'Log in'
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button 'Log in'
end
