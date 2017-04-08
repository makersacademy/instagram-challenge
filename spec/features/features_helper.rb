def user_sign_up
  click_link 'Sign Up'
  fill_in :user_username, with: 'test1'
  fill_in :user_email, with: 'test@example.com'
  fill_in :user_password, with: 'password123'
  fill_in :user_password_confirmation, with: 'password123'
  click_button 'Sign up'
end
