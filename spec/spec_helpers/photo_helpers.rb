def create_photo(photo_url: 'hello.png', description: 'hello')
  click_link 'Add a new photo'
  fill_in 'Photo url', with: photo_url
  fill_in 'Description', with: description
  click_button 'Add photo'
end
