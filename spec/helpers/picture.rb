module PictureHelpers

  def create_picture(name: 'Me', description: 'A picture of me')
    visit root_path
    click_link 'Add a picture'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Upload picture'
  end
end
