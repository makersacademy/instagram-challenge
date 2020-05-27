module PictureHelper

  def upload_image
    click_link 'New Picture'
    attach_file 'Image', Rails.root + 'spec/fixtures/cat.jpeg'
    click_button 'Create Picture'
  end

end
