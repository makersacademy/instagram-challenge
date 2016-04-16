def sign_in_as(user)
  visit "/"
  click_link "Sign in"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Log in"
end
