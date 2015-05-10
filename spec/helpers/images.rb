module ImageHelpers

  def create_an_image
    visit '/images'
    click_link 'Upload Image'
    fill_in 'Description', with: 'My face'
    attach_file "Image", "spec/fixtures/files/myface.jpg"
    click_button 'Upload'
  end

end
