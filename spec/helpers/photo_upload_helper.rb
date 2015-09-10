def upload_photo
  visit('/')
  click_link "Upload Photo"
  attach_file("photo[picture]", "spec/images/dimensions.png")
  click_button 'Create Photo'
end
