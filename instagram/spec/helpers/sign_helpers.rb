def signup1
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def signup2
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in(email, password)
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Sign in')
end
