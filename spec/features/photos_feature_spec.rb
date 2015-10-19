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
      expect(page).to have_content('Successfully posted')
    end

    scenario 'can include a description' do
      visit '/'
      click_link 'Post new pic'
      attach_file(:photo_image, 'spec/fixtures/files/test_image.jpg')
      fill_in 'Description', with: 'The Fonz rulz!'
      click_button 'Post'
      expect(page).to have_content('The Fonz rulz!')
    end

    scenario 'raises an error when no photo provided' do
      visit '/'
      click_link 'Post new pic'
      click_button 'Post'
      expect(page).to have_content('Image required')
      expect(Photo.all.count).to eq 0
    end

  end

end