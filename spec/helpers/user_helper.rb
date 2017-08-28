def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_username', with: 'squidward'
  fill_in 'user_email', with: 'tentacles@ink.com'
  fill_in 'user_password', with: 'password123'
  fill_in 'user_password_confirmation', with: 'password123'
  click_button "Go"
end

def log_in
  click_link 'Login'
  fill_in 'user_email', with: 'tentacles@ink.com'
  fill_in 'user_password', with: 'password123'
  click_button "Go"
end

def log_out
  click_link 'Log out'
end
