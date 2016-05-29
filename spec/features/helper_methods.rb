def log_in(email = "amy@gmail.com", password = "testtest")
  visit("/")
  click_link "Login"
  fill_in("Email", with: email)
  fill_in("Password", with: password)
  click_button("Log in")
end

def sign_up(username = "myUsername")
  visit("/")
  click_link("Sign up")
  fill_in("Username", with: username)
  fill_in("Email", with: "test@example.com")
  fill_in("Password", with: "testtest")
  fill_in("Password confirmation", with: "testtest")
  click_button("Sign up")
end
