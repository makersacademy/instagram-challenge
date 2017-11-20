def create_post
  visit '/'
  click_link 'New Post'
  attach_file('Image', 'spec/files/images/foodart.jpg')
  fill_in 'Caption', with: 'amazing #foodart'
  click_button 'Create Post'
end
