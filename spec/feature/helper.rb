def sign_up(email, password, password_confirmation)
  visit 'users/sign_up'
  fill_in "user[email]", :with => email
  fill_in 'user[password]' ,:with => password
  fill_in "user[password_confirmation]", :with => password_confirmation
  click_button "Sign up"
end

def log_in(email, password)
  visit 'users/sign_in'
  fill_in "user[email]", :with => email
  fill_in 'user[password]', :with => password
  click_button "Log in"
end
