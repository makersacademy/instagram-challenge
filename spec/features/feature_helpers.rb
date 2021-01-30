def log_in
  user = User.create(username: "TestUser", email: "Test@example.com", password: "password")
  visit '/'
  fill_in "Email", with: "Test@example.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end
