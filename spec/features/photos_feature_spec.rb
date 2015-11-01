require 'rails_helper'

describe 'Photos' do

  before do
    visit '/'
  end

  context 'no photos added' do

    scenario 'advises no photos added with link to add new' do
      expect(page).to have_content 'No photos to show'
      expect(page).to have_link 'Post new pic'
    end

  end

  context 'posting a photo' do

    scenario 'displays the photo' do
      post_pic
      expect(page).to have_css "img[src*='test_image.jpg']"
      expect(page).not_to have_content('No photos to show')
      expect(page).to have_content('Successfully posted')
    end

    scenario 'can include a description' do
      post_pic('New description')
      expect(page).to have_content('New description')
    end

    scenario 'raises an error when no photo provided' do
      click_link 'Post new pic'
      click_button 'Post'
      expect(page).to have_content('Image required')
      expect(Photo.all.count).to eq 0
    end

  end

  context 'deleting photos' do

    before do
      post_pic
    end

    scenario 'removes the photo' do
      click_button 'Remove'
      expect(page).not_to have_content('Testing default')
      expect(page).not_to have_css "img[src*='test_image.jpg']"
      expect(page).to have_content('No photos to show')
      expect(page).to have_content('Pic removed')
    end
  end
end
