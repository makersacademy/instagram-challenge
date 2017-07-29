
def sign_up(username: "jking", email: "jking@gmail.com", password: "123456", password_confirmation: "123456")
  click_on "Sign Up"
  fill_in 'user_username', with: username
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_out
  click_on "Sign Out"
end

def log_in(email: "jking@gmail.com", password: "123456")
  click_on "Sign In"
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button "Log in"
end


def create_pic()
end
