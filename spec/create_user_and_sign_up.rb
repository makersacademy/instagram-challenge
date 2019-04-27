def create_user_and_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in("user_username", with: "testuser")
  fill_in("user_email", with: "test@com")
  fill_in("user_password", with: "password")
  fill_in("user_password_confirmation", with: "password")
  click_button("Sign up")
end
