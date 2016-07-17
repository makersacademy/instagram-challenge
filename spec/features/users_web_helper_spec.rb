def sign_up
  visit root_path
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_diff_user
  visit root_path
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'test2test2')
  fill_in('Password confirmation', with: 'test2test2')
  click_button('Sign up')
end
