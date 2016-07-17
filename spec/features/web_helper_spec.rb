def create_post
  visit posts_path
  click_button 'Add a Picture'
  attach_file "Image", "./docs/testing.jpg"
  fill_in 'Title', with: 'PIC'
  fill_in 'Description', with: 'Description_text'
  click_button 'Post'
end

def create_post_no_image
  visit posts_path
  click_button 'Add a Picture'
  fill_in 'Title', with: 'PIC'
  fill_in 'Description', with: 'Description_text'
  click_button 'Post'
end

def create_post_invalid_title
  visit posts_path
  click_button 'Add a Picture'
  attach_file "Image", "./docs/testing.jpg"
  fill_in 'Title', with: 'PI'
  fill_in 'Description', with: 'Description_text'
  click_button 'Post'
end

def edit_post
  click_link 'PIC'
  click_button 'Edit'
  fill_in 'Title', with: 'edited PIC'
  fill_in 'Description', with: 'edited Description'
  click_button 'Update'
end
