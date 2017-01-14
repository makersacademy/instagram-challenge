def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'abcd1234')
  fill_in('Password confirmation', with: 'abcd1234')
  click_button('Sign up')
end
