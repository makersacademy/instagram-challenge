def sign_up(name: "Mimi", email: "Mimi@fake.com",  password: "password", password_confirmation: "password")
  fill_in(:user_name, with: name)
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  fill_in(:user_password_confirmation, with: password_confirmation)
  click_button('Sign up')
end

def log_in(email: "Mimi@fake.com",  password: "password")
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  click_button('Log in')
end
