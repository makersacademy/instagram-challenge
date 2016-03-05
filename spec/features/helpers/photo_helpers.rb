def upload_photo
  visit '/photos'
  click_link 'Upload photo'
  fill_in 'Description', with: 'My photo of a hammer'
  attach_file 'Image', Rails.root + 'spec/features/images/hammericon.png'
  click_button 'Create Photo'
end

def leave_comment
  click_link 'Add comment'
  fill_in 'Comment', with: 'This is my comment'
  click_button 'Leave Comment'
end
