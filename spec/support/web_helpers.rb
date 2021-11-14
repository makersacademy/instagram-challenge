def register
  visit "/"
  click_link "Sign Up"
  fill_in "user[username]", with: "Test User"
  fill_in "user[email]", with: "user@example.com"
  fill_in "user[password]", with: "smeagol"
  fill_in "user[password_confirmation]", with: "smeagol"
  click_button "Sign up"
end
