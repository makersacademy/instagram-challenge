require 'rails_helper'

feature 'Photos' do
  context 'viewing photos' do

    scenario 'when no photos added should display a prompt to add a picture' do
      sign_up
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet!'
      expect(page).to have_link('Upload photo')
    end
    #
    # scenario 'should not allow access to photos if not logged in' do
    #   sign_up
    #   click_link('Sign out')
    #   visit '/photos'
    #   expect(page).to have_content 'You need to sign up first!'
    # end
  end

  context 'creating photos' do

    scenario 'user is able to upload a photo' do
      upload_photo
      expect(page).to have_css("img[src*='teckel.jpeg']")
    end

    scenario 'an image must be uploaded during photo upload' do
      sign_up
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
