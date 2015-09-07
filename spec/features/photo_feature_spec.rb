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

    before do
      user = create(:user)
      sign_in_as(user)
    end

    scenario 'photos can be uploaded' do
      visit photos_path
      expect(page).to have_content 'No photos yet'
      click_link 'Add a photo'
      fill_in 'Title', with: 'test photo'
      attach_file("photo[image]", "spec/assets_specs/photos/test_photo1.jpg")
      click_button 'Create Photo'
      expect(page).to have_selector 'img'
      expect(page).to have_css ('img[src*="test_photo1.jpg"]')
      expect(page).to have_content 'added by: test_user@test.com'
    end

    scenario 'unable to upload without a file' do
      visit photos_path
      expect(page).to have_content 'No photos yet'
      click_link 'Add a photo'
      fill_in 'Title', with: 'test photo'
      click_button 'Create Photo'
      expect(page).not_to have_selector 'img'
      expect(page).not_to have_css ('img[src*="test_photo1.jpg"]')
      expect(page).not_to have_content 'added by: test_user@test.com'
      expect(page).to have_content 'photo not provided'
    end

  end

  context 'user not logged in' do
    it 'does not allow no logged in user to upload' do
      visit photos_path
      click_link 'Add a photo'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end

