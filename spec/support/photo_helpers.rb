def upload_photo
  visit '/photos'
  click_link 'Upload a new photo'
  fill_in 'Title', with: 'Tomato'
  attach_file("photo[image]", "spec/asset_specs/photos/tomato.jpg")
  click_button 'Upload'
end