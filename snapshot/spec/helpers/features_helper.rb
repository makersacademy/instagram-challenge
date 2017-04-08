def add_post
  click_link 'New Post'
  attach_file('Image', "spec/images/NPG.jpg")
  fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
  click_button 'Create Post'
end
