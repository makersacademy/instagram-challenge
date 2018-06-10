def sign_up_and_sign_in
  visit "/"
  click_link "Register"
  fill_in "Name", with: "Emma"
  fill_in "Email", with: "emma@hotmail.com"
  fill_in('Password', with: 'emma11', match: :first)
  fill_in('Password confirmation', with: 'emma11', match: :prefer_exact)
  click_button "Sign up"
end
