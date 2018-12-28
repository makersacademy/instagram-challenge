def sign_up(user)
  visit "/sign_up"
  within "#sign-up-form" do
    fill_in "user_first_name", with: user.first_name
    fill_in "user_last_name", with: user.last_name
    fill_in "user_username", with: user.username
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign Up"
  end
end

def sign_in(user)
  visit "/sign_in"
  within "#sign-in-form" do
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Sign In"
  end
end
