require 'rails_helper'

feature 'photos' do

  before do
    sign_up
  end

  context 'no photos have been added' do

    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Upload a photo'
    end
  end

  context 'uploading a photo' do

    scenario 'fill out form' do
      add_photo
      expect(current_path).to eq '/photos'
    end

    scenario 'should show photo on index page' do
      add_photo
      expect(page).to have_css("img[src*='sunrise.jpg']")
    end
  end

  context 'showing photos' do

    scenario 'show photo on page' do
      add_photo
      click_photo
      expect(page).to have_css("img[src*='sunrise.jpg']")
    end
  end

  context 'deleting photos' do

    scenario 'user can delete their photo' do
      add_photo
      click_photo
      click_link "Delete photo"
      expect(page).not_to have_css "img[src*='sunrise.jpg']"
    end

    scenario 'flash message appears' do
      add_photo
      find(".photo").click
      visit "photos/#{Photo.first.id}"
      click_link "Delete photo"
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end
