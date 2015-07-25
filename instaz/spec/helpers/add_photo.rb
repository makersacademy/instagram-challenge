def add_photo
  file_path = "./app/assets/images/cat.jpg"
  visit '/'
  click_link 'Upload Image'
  fill_in 'Name', with: 'Grumpy cat'
  fill_in 'Description', with: 'Between us'
  attach_file "photo_image", file_path
  click_button 'Upload'
end