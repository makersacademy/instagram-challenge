def upload_photo
  visit '/photos'
  click_link 'Add a photo!'
  fill_in 'Description', with: "A fun trip to the beach!"
  click_button 'Upload photo'
end
