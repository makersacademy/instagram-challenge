require 'rails_helper'

feature 'photos' do
  context 'no photos are uploaded' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Upload photo'
    end
  end

  context 'Uploading a photo' do
    scenario 'user should see the photo' do
      visit '/photos'
      click_link 'Upload photo'
      fill_in 'Description', with: 'My photo of a hammer'
			attach_file 'Image', Rails.root + 'spec/features/images/hammericon.png'
			click_button 'Create Photo'
			expect(page).to have_selector("img[src*=hammericon]")
    end
  end
end
