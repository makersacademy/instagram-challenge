def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'user[username]', with: "Mr.Test"
  fill_in 'user[email]', with: "test@test.com"
  fill_in 'user[password]', with: "test"
  fill_in 'user[password_confirmation]', with: "test"
  click_button 'Submit'
end

def sign_out
  click_link 'Logout'
end

def sign_in
  visit '/'
  click_link 'Log In'
  fill_in 'user[email]', with: "test@test.com"
  fill_in 'user[password]', with: "test"
end
