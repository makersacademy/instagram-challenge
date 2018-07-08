def sign_up_successfully
  visit root_path
  click_link "Sign up"
  fill_in "Email", with: 'validemail@gmail.com'
  fill_in "Firstname", with: "Rob"
  fill_in "Lastname", with: "Faldo"
  fill_in "Password", with: "validPassword"
  fill_in "Password confirmation", with: "validPassword"
  click_button 'Sign up'
end
