def sign_up_and_sign_in(email: 'user0@users.com', password: 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_out
  visit '/users/sign_out'
end
