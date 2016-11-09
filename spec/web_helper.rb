def signing_up(email: 'test@example.com')
  visit('/')
  click_link('Register')
  fill_in('User name', with: 'sxyrailsdev')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest', match: :first)
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
