module ImageHelpers

  def create_an_image
    visit '/images'
    click_link 'Upload Image'
    fill_in 'Description', with: 'My face'
    click_button 'Upload'
  end

end
