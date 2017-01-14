def add_photo
  visit('/photos/new')
  fill_in 'Caption', with: 'Travelling'
  attach_file("photo_image", Rails.root + "spec/fixtures/test.jpg")
  click_button('Create Photo')
end
