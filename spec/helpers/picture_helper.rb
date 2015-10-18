def add_picture (picture)
  click_link 'Add a picture'
  attach_file 'picture[image]', picture
  click_button 'Create Picture'
end