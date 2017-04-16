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
  attach_file('post_image', 'spec/spec_photo.jpg')
  click_button 'Create Post'
end
