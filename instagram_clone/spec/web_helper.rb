def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Username', with: 'TEST')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_out
  visit('/')
  expect(page).to have_link('Sign out')
end

def create_contribution
  click_link('Add a contribution')
  fill_in('Comment', with: 'A black cat')
  click_button('Create Contribution')
end
