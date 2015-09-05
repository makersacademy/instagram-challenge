require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'displays prompt to add a photo' do
      visit photos_path
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end

feature 'upload a photo' do
  context 'allows upload of photos' do
    scenario 'photos can be uploaded' do
      visit photos_path
      expect(page).to have_content 'No photos yet'
      click_link 'Add a photo'
      fill_in 'Title', with: 'test photo'
      attach_file("photo[image]", "spec/assets_specs/photos/test_photo1.jpg")
      click_button 'Create Photo'
      expect(page).to have_selector 'img'
    end
  end
end

