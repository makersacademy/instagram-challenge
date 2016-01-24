def upload_photo
  visit '/photos'
  click_link 'Upload photo'
  attach_file('photo[image]', "spec/fixtures/files/teckel.jpeg")
  fill_in 'Caption', with: 'cutie'
  click_button 'Upload photo'
end
