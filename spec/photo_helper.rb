module PhotoSpecHelpers

def upload_photo
  visit '/photos'
  fill_in 'Caption', with: 'Here is my fish!'
  attach_file('Image', 'spec/files/fish.jpg')
  click_button 'Create Photo'
end

end