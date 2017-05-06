def upload_photo
  visit '/photos'
  click_link 'Add a photo'
  fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
  fill_in 'Location', with: 'Somewhere pretentious'
  attach_file('Image', Rails.root + "spec/fixtures/rick-astley.jpg")
  click_button 'Upload Photo'
end
