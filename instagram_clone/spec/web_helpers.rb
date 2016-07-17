def create_post
  visit '/'
  click_link 'New Post'
  attach_file('Image', "spec/files/images/coffee.jpg")
  fill_in 'Caption', with: 'nom nom nom #coffeetime'
  click_button 'Create Post'
end
