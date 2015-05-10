module ImageHelpers

  def create_an_image file_path = "spec/fixtures/files/myface.jpg"
    visit '/images'
    click_link 'Upload Image'
    fill_in 'Description', with: 'My face'
    attach_file "Image", file_path
    click_button 'Upload'
  end

end
