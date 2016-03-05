require 'rails_helper'
require_relative './helpers/photo_helpers'

feature 'photos' do
  context 'no photos are uploaded' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Upload photo'
    end
  end

  context 'Uploading a photo' do
    scenario 'user should see the photo' do
      upload_photo
			expect(page).to have_selector("img[src*=hammericon]")
      expect(page).to have_content('My photo of a hammer')
    end
  end

  context 'Photo is uploaded' do
    scenario 'user can delete the photo' do
      upload_photo
      click_link 'Delete photo'
			expect(page).not_to have_selector("img[src*=hammericon]")
      expect(page).not_to have_content('My photo of a hammer')
    end
  end


end
