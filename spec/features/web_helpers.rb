def add_picture
  click_link 'Add picture'
  attach_file 'picture_image', Rails.root + 'spec/features/test.jpg'
  fill_in "Caption", with: 'First pic'
  click_button 'Upload picture'
end
