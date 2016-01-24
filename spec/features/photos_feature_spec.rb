require 'rails_helper'

feature 'photos' do
  context 'viewing photos' do
    scenario 'no photos added' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet!'
    end
    scenario 'should display a prompt to add a picture' do
      visit '/photos'
      expect(page).to have_link('Upload photo')
      expect(page).to have_content 'No photos uploaded yet!'
    end
  end

  context 'creating photos' do
    scenario 'user is able to upload a photo' do
      upload_photo
      expect(page).to have_css("img[src*='teckel.jpeg']")
    end

    scenario 'an image must be uploaded during photo upload' do
      visit '/photos'
      click_link 'Upload photo'
      fill_in 'Caption', with: 'cutie'
      click_button 'Upload photo'
      expect(page).to have_content 'Please upload photo'
    end
  end

  context 'deleting photos' do
    scenario 'user can remove photo by clicking delete button' do
      upload_photo
      click_link 'Delete photo'
      expect(page).to have_content 'Chill...photo deleted'
    end
  #
  #   scenario 'user cannot remove photos uploaded by other users' do
  #   end
  end
  #
  context 'editing photo upload' do
    scenario 'user can edit upload by clicking edit button' do
      upload_photo
      click_link 'Edit photo'
      fill_in 'Caption', with: 'bla bla'
      click_button 'Update photo'
      expect(page).to have_content 'bla bla'
    end

    # scenario 'user cannot remove photos uploaded by other users' do
    # end
  end

end
