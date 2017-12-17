def add_photo
  visit '/photos/new'
  fill_in('photo_title', with: 'Beach')
  fill_in('photo_description', with: 'It\'s a very nice beach photo')
  attach_file("photo_photo", "spec/asset_specs/photos/photo.jpeg")
  click_button("Add Photo")
end
