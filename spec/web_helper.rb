def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "Test"
  fill_in "Username", with: "testboi"
  fill_in "Email", with: "asd@dsa"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_button "Sign up"
end

def log_in
  visit "/"
  fill_in "Email", with: "bob@bob.com"
  fill_in "Password", with: "bbbbbbb"
  click_button "Log in"
end
