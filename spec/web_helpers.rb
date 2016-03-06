def sign_up(email: 'test@email.com',
            password: 'test1234',
            password_confirmation: 'test1234')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def log_in(email: 'test@email.com',
            password: 'test1234')
  visit '/'
  click_link 'Log in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def log_out
  click_link 'Log out'
end

def post_photo(file_path: nil,
               description: 'Sample post')
  visit '/'
  click_link 'Post a photo'
  fill_in 'Description', with: description
  click_button 'Post'
end
