def signup_as_new_user(user)
  visit "/"
  click_button "Create Account"
  fill_in "user[username]", with: "#{user}"
  fill_in "user[password]", with: "password"
  fill_in "user[email]", with: "#{user}@gmail.com"
  click_button "Create Account"
end
