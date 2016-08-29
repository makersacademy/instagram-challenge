def post_photo
  visit '/'
  click_link 'Add Photo'
  attach_file("photo_image", Rails.root + 'spec/images/selfie.jpg')
  fill_in 'Description', with: 'Selfie'
  click_button 'Post Photo'
end
