def sign_up_for_an_account
  visit '/users/sign_up'

  fill_in 'user_email', with: 'user@example.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'

  click_button 'Sign up'
end

def create_user_in_database
  User.create(email: 'user@example.com', password: 'password')
end