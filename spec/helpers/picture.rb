module PictureHelpers
  def post_picture
    visit '/pictures'
    click_link 'Add a picture'
    attach_file('Picture', './spec/fixtures/associations.jpg')
    fill_in 'Description', with: 'Nice'
    click_button 'Post'
  end
end
