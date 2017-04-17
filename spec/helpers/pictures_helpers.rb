require 'rails_helper'

module PicturesHelpers
  def add_picture(description)
    click_link 'Add a picture'
    page.attach_file('picture[image]', Rails.root + 'spec/fixtures/test.jpg')
    fill_in 'Description', with: description
    click_button 'Create Picture'
  end

  def add_view_picture
    click_link 'View picture'
    click_link 'Leave a comment'
  end
end
