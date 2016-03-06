def add_photo
  visit '/photos'
  click_link 'Add a photo'
  attach_file 'Image', Rails.root.join('spec','features','img.jpg')
  click_button 'Create Photo'
end
