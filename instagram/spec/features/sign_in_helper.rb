def sign_in
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'bob@bob.com')
  fill_in('Password', with: 'bob123')
  fill_in('Password confirmation', with: 'bob123')
  click_button('Sign up')
end
