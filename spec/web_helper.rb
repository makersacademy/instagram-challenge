def sign_up(email: "batman@hotmail.com",
            password: "123456",
            password_confirmation: "123456")
  visit "/"
  click_link 'Sign up'
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password_confirmation)
  click_button "Sign up"
end
