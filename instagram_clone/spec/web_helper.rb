def sign_up
  visit('/')
  click_link('Sign up')
  fill_in 'Username', with: 'test'
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
