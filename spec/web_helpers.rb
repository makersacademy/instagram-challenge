def sign_up_sign_in
  visit '/'
  click_link 'Sign up'
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in
  visit '/'
  click_link 'Sign in'
  fill_in('Email', with: 'mail@mail.com')
  fill_in('Password', with: '123456')
  click_button('Log in')
end
