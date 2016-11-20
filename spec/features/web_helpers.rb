def upload_a_photo
  visit '/photos'
  click_link 'Post a photo'
  attach_file "Image", Rails.root + 'spec/features/test_images/chase.jpg'
  click_button 'Create Photo'
end
