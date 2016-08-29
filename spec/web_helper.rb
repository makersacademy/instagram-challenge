def add_photo
  visit '/'
  click_link 'Add a photo'
  attach_file "photo_image", Rails.root + 'spec/fixtures/files/wham.jpg'
  fill_in :photo_caption, with: 'WHAM!'
  click_button 'Post photo'
end
