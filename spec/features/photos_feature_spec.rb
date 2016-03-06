require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'add photos' do
    before do
      Photo.create(description: 'The Beach')
    end

    scenario 'should display the photo description' do
      visit '/photos'
      expect(page).to have_content 'The Beach'
    end
  end

  context 'creating photos' do
    scenario 'asks user to describe the photo being uploaded' do
      visit '/'
      sign_up('harry@random.com', 'password123')
      click_link 'Add a photo'
      fill_in 'Description', with: 'The Beach'
      click_button 'Create Photo'
      expect(page).to have_content 'The Beach'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/'
      sign_up('harry@random.com', 'password123')
      upload
      click_link 'Delete'
      expect(page).not_to have_content 'The Beach'
      expect(page).to have_content 'Photo deleted successfully'
    end

  end

  context 'deleting uploaded photos' do
    scenario 'a user can only delete photos they uploaded' do
      visit '/'
      sign_up('harry@random.com', 'password123')
      upload
      click_link 'Sign out'
      sign_up('sid@sloth.com', 'password123')
      click_link 'Delete'
      expect(page).to have_content 'The Beach'
      expect(page).to have_content 'This is not your photo to delete'
    end
  end
end
