def create_post
  visit posts_path
  click_button 'Add a Picture'
  attach_file "Image", "./docs/testing.jpg"
  fill_in 'Title', with: 'PIC'
  click_button 'Post'
end

def edit_post
  click_link 'PIC'
  click_button 'Edit'
  fill_in 'Title', with: 'edited PIC'
  fill_in 'Description', with: 'edited Description'
  click_button 'Update'
end
