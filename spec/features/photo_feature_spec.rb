require 'rails_helper'

feature 'Photos' do
  context 'No photos have been added' do
    scenario 'Should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'Photos have been added' do
    before {Photo.create descr: 'Mount Fuji'}
    scenario 'Display photos' do
      visit '/photos'
      expect(page).to have_content('Mount Fuji')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'Adding photos' do
    scenario 'prompts user to add photo, then displays the description' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Description', with: 'Mount Fuji'
      click_button 'Add photo'
      expect(page).to have_content 'Mount Fuji'
      expect(current_path).to eq '/photos'
    end
  end

  context 'Viewing photos' do
    let!(:mount_fuji){Photo.create(descr:'Mount Fuji')}
    scenario 'Lets a user view profile page of a photo' do
      visit '/photos'
      click_link 'Mount Fuji'
      expect(page).to have_content 'Mount Fuji'
      expect(current_path).to eq "/photos/#{mount_fuji.id}"
    end
  end

  context 'Editing photos' do
    before {Photo.create descr: 'Mount Fuji'}
    scenario 'Let a user edit a photo' do
      visit '/photos'
      click_link 'Edit Mount Fuji'
      fill_in 'Description', with: 'On top of Mount Fuji'
      click_button 'Update photo'
      expect(page).to have_content 'On top of Mount Fuji'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    before {Photo.create descr: 'Mount Fuji'}
    scenario 'removes a photo when user clicks a delete link' do
      visit '/photos'
      click_link 'Delete Mount Fuji'
      expect(page).not_to have_content 'Mount Fuji'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end