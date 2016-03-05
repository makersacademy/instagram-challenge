def upload_photo
  visit '/photos'
  click_link 'Upload photo'
  fill_in 'Description', with: 'My photo of a hammer'
  attach_file 'Image', Rails.root + 'spec/features/images/hammericon.png'
  click_button 'Create Photo'
end
