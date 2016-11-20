def user_sign_up
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: '000000')
  fill_in('Password confirmation', with: '000000')
  click_button('Sign up')
end
