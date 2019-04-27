def sign_up_helper(email:, password:, username:)
  visit '/users/new'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_username', with: username
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign Up'
end

def sign_in_helper(email:, password:)
  visit '/login'
  fill_in 'session_email', with: email
  fill_in 'session_password', with: password
  click_button 'Sign In'
end
