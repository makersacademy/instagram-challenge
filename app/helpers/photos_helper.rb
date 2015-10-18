module PhotosHelper

  def create_photo
    click_link 'Add a photo'
    fill_in 'photo_title', with: 'Test Title'
    fill_in 'photo_description', with: 'Test description'
    attach_file 'photo_image', "spec/features/files/test.jpg"
    click_button "Create Photo"
  end

end
