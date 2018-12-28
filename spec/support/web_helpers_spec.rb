def sign_up(user)
  visit "/sign_up"
  fill_in "user_first_name", with: user.first_name
  fill_in "user_last_name", with: user.last_name
  fill_in "user_username", with: user.username
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  fill_in "user_password_confirmation", with: user.password
  click_button "Sign Up"
end
