def sign_up(email: 'test@example.com', username: 'test')
  visit '/'
  fill_in 'Email', with: email
  fill_in 'Username', with: username
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  click_button 'Sign up'
end

def create_a_post(image_name: 'edge.jpg', description: 'This is my first post :)')
  visit '/'
  click_link 'Upload'
  fill_in 'Description', with: description
  attach_file('post_image', "#{Dir.pwd}/spec/features/test_images/#{image_name}")
  click_button 'Post'
end
