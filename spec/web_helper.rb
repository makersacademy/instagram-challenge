def sign_up
  visit('/')
  click_link('Log in')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Username', with: 'TEST')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_2
  visit('/')
  click_link('Log in')
  click_link('Sign up')
  fill_in('Email', with: 'test1@example.com')
  fill_in('Username', with: 'ANOTHER')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in
  visit('/')
  click_link('Log in')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end

def sign_out
  click_link('Log out')
end

def create_contribution
  click_link('+')
  fill_in('Comment', with: 'A black cat')
  click_button('Create Contribution')
end
