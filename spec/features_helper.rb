def user_sign_up
  visit "/users/sign_up"
  fill_in "user_username", with: "Lazy"
  fill_in "user_email", with: "12@23.com"
  fill_in "user_password", with: "123456"
  fill_in "user_password_confirmation", with: "123456"
  click_button "Sign up"
end

def user_sign_in
  visit "/"
  fill_in "user_email", with: "12@23.com"
  fill_in "user_password", with: "123456"
  click_button "Log in"
end
