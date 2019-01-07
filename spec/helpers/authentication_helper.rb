def sign_up_as_user_a
  visit "/"
  click_link "Sign up"
  fill_in "Username", with: "user_a"
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "sixcharacters"
  fill_in "Password confirmation", with: "sixcharacters"
  click_button "Sign up"
end
