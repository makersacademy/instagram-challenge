def create_picture
  visit '/pictures'
  click_link 'Add a picture'
  attach_file('picture_image', File.absolute_path('./public/cat.png'))
  fill_in 'picture_caption', with: 'This is my cat'
  click_button 'Create Picture'
end
