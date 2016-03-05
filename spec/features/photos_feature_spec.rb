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

    scenario 'shows the time of when the photo was uploaded' do
      new_time = Time.local(2016, 1, 1, 12, 0, 0)
      Timecop.travel(-3600)
      sign_up_helper
      upload_photo
      Timecop.return
      visit photos_path
      expect(page).to have_content('Uploaded about 1 hour ago')
    end
  end

  context 'Photo is uploaded' do
    before do
      sign_up_helper
      upload_photo
    end
    scenario 'user can delete the photo' do
      click_link 'Delete photo'
			expect(page).not_to have_selector("img[src*=hammericon]")
      expect(page).not_to have_content('My photo of a hammer')
    end

    scenario 'users can only delete their own photos' do
      sign_up_with_second_user
      visit photos_path
      expect(page).not_to have_link('Delete photo')
    end
  end


end
