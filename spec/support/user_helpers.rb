def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_two
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'test123')
  fill_in('Password confirmation', with: 'test123')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign out')
end

def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'test123')
  click_button('Log in')
end
