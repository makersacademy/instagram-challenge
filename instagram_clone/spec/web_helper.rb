def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def do_post
  visit '/'
  click_link 'Add Post'
  page.attach_file 'Image', Rails.root + 'spec/fixtures/test.jpg'
  fill_in 'Description', with: 'Coding is fun'
  click_button 'Create Post'
end
