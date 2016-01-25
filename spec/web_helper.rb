def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'test1234'
  fill_in 'Password confirmation', with: 'test1234'
  click_button 'Sign up'
end

def sign_up2
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'testtest@gmail.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def create_post
  click_link 'New Post'
  fill_in 'Description', with: 'Burger'
  click_button 'Create Post'
end
