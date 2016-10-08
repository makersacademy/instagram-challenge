def sign_in(email: "test@test.com", password: "123456")
  visit('/')
  click_link('Log in')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_button('Log in')
end

def sign_out
  click_link('Log out')
end
