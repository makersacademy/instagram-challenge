module Helpers

  def post_pic(description = 'Testing default')
    click_link 'Post new pic'
    attach_file(:photo_image, 'spec/fixtures/files/test_image.jpg')
    fill_in 'Description', with: description
    click_button 'Post'
  end

end