def upload_photo
  visit '/photos'
  click_link 'Add a photo'
  fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
  fill_in 'Location', with: 'Somewhere pretentious'
  click_button 'Upload Photo'
end
