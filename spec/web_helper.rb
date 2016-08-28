def upload_image(description: "Test description",
                 picture_image: Rails.root + 'spec/images/Test.JPG')
  visit '/'
  click_link 'Upload a picture'
  fill_in 'Description', with: description
  page.attach_file("picture_image", picture_image)
  click_button 'Upload Picture'
end
