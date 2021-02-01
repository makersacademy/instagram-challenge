def sign_up_kiki
  visit root_path
  click_button "Sign Up"
  fill_in "user[username]", with: "Kiki"
  fill_in "user[email]", with: "kiki@instakilo.com"
  fill_in "user[password]", with: "password"
  click_button "Create Account"
end
