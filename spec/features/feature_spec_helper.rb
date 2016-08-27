def sign_up
  visit new_user_registration_path
  fill_in 'Email', with: 'tim@test.com'
  fill_in 'User name', with: 'tc'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end

def new_post
  visit posts_path
  click_link 'New Post'
  fill_in 'Caption', with: 'Amazing. #jackspoint #queenstown'
  attach_file('Image', File.absolute_path('./public/system/posts/images/000/000/001/medium/jackspoint.jpeg'))
  click_button 'Create Post'
end
