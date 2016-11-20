def sign_up_and_sign_in(email: 'marky@mark.com', password: 'secret')
  visit '/users/sign_up'
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button 'Sign up'
end

def sign_out
  click_link "Sign out"
end
