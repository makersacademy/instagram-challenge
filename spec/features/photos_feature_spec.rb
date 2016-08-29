require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add Photo'
    end
  end

  context 'photos have been added' do
    before do
      post_photo
    end

    scenario 'display photos' do
      visit '/'
      expect(page.find('img')['src']).to have_content 'selfie.jpg'
      expect(page).to have_content('Selfie')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      post_photo
      expect(page).to have_content 'Selfie'
      expect(current_path).to eq '/'
    end
  end

  context 'an invalid photo' do
    it 'does not let you submit without an image' do
      visit '/'
      click_link 'Add Photo'
      fill_in 'Description', with: 'Selfie'
      click_button 'Post Photo'
      expect(page).not_to have_content 'selfie.jpg'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing photos' do
    before do
      post_photo
    end

    scenario 'lets a user view a photo' do
      visit '/'
      click_link 'photo_link'
      expect(page.find('img')['src']).to have_content 'selfie.jpg'
      expect(page).to have_content 'Selfie'
    end
  end

  context 'editing photos' do
    before do
      post_photo
    end

    scenario 'let a user edit a photo' do
      visit '/'
      click_link 'Edit Photo'
      fill_in 'Description', with: 'Shameless selfie'
      click_button 'Update Photo'
      expect(page).to have_content 'Shameless selfie'
      expect(current_path).to eq '/'
    end
  end

  context 'deleting photos' do
    before do
      post_photo
    end

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/'
      click_link 'Delete Photo'
      expect(page).not_to have_content 'Selfie'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end
