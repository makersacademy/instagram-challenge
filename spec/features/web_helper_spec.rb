def create_post
  visit posts_path
  click_link 'Add a picture'
  attach_file "Image", "./docs/testing.jpg"
  fill_in 'Title', with: 'PIC'
  click_button 'Post'
end
