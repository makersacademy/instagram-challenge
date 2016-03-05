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
      sign_up_helper
      upload_photo
			expect(page).to have_selector("img[src*=hammericon]")
      expect(page).to have_content('My photo of a hammer')
    end

    scenario 'users should not be able to add a photo if not logged in' do
      visit ('/')
      click_link('Upload photo')
      expect(current_path).not_to eq(new_photo_path)
    end
  end

  context 'Photo is uploaded' do
    scenario 'user can delete the photo' do
      sign_up_helper
      upload_photo
      click_link 'Delete photo'
			expect(page).not_to have_selector("img[src*=hammericon]")
      expect(page).not_to have_content('My photo of a hammer')
    end

    scenario 'users can only their delete their own photos' do
      sign_up_helper
      upload_photo
      sign_up_with_second_user
      visit photos_path
      expect(page).not_to have_link('Delete photo')
      # expect(page).to have_content('so so')
    end
  end


end
