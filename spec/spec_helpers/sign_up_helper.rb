def sign_up(email="test@mail.com")
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

def sign_in(email)
  visit "/"
  click_link "Sign in"
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  click_button "Sign in"
end
