def log_in(email = 'test@ymail.com', password = 'supersecret')
  visit '/'
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  click_button "Log in"
end

def sign_up(email = 'test@ymail.com', username = "user.me", password = 'supersecret', password_confirmation = 'supersecret')
  visit '/'
  click_link "Sign up"
  fill_in "user[email]", with: email
  fill_in "user[name]", with: username
  fill_in "user[password]", with: password
  fill_in "user[password_confirmation]", with: password
  click_button "Sign up"
end