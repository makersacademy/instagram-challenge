def sign_up(email: 'alex@alex.com', password: 'testtest')
  visit '/gifs'
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end
