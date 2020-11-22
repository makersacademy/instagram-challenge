def sign_up(username, full_name, email, password, password_confirmation)
  click_link "Sign up"
  fill_in "Username", with: username
  fill_in "Full name", with: full_name
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password_confirmation
  click_button "Sign up"
end