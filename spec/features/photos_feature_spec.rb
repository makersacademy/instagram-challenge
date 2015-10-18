require 'rails_helper'

describe 'Photos' do

  context 'no photos added' do

    scenario 'advises no photos added with link to add new' do
      visit '/'
      expect(page).to have_content 'No photos to show'
      expect(page).to have_link 'Post new pic'
    end

  end

  context 'posting a photo' do

    # let(:test_image){ fixture_file_upload('files/test_image.jpg', 'image/jpg') }

    scenario 'displays the photo' do
      visit '/'
      click_link 'Post new pic'
      # p test_image
      attach_file(:photo_image, 'spec/fixtures/files/test_image.jpg')
      click_button 'Post'
      expect(page).to have_css "img[src*='test_image.jpg']"
      expect(page).not_to have_content('No photos to show')
    end

  end

end