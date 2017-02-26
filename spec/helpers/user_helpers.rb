def sign_up(username: "testuser",
            email: "test@example.com",
            password: "topsecret",
            password_confirmation: "topsecret")
  visit('/')
  click_link('Sign up')
  fill_in('Username', with: username)
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password_confirmation)
  click_button('Sign up')
end
