def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_new_post
  visit '/posts'
  click_link 'New Post'
  fill_in 'Caption', with: 'Caption content'
  click_button 'Create Post'
end
