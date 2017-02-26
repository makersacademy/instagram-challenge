def sign_in(email: "test@example.com",
            password: "topsecret")
  visit('/')
  click_link('Log in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Log in')
end

def sign_out
  visit('/')
  click_link('Log out')
end
