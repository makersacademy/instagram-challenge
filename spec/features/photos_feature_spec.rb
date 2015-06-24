require 'rails_helper'
require_relative '../helpers/session_helpers.rb'

include Session

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
      expect(page).to have_content 'Mount Fuji'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'Adding photos (signed in)' do
    before {sign_up('test@example.com', 'password')}
    scenario 'Prompts user to add photo, then displays the description' do
      click_link 'Add a photo'
      fill_in 'Description', with: 'Mount Fuji'
      click_button 'Add photo'
      expect(page).to have_content 'Mount Fuji'
      expect(current_path).to eq '/photos'
    end

    scenario 'Does not let you submit without an image file' do
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/mount_fuji.jpg'
      fill_in 'Description', with: 'Mount Fuji'
      click_button 'Add photo'
      expect(page).to have_content 'Mount Fuji'
      expect(page).to have_css('img[src*="mount_fuji.jpg"]')
    end

    scenario 'Does not let you submit a blank description' do
      click_link 'Add a photo'
      click_button 'Add photo'
      expect(page).not_to have_css 'h3'
      expect(page).to have_content 'Description cannot be left blank'
    end
  end

  context 'Adding photos (not signed in)' do
    scenario 'Does not allow user to add photos' do
      visit '/photos'
      click_link 'Add a photo'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(page).not_to have_content 'Description:'
    end
  end

  context 'Viewing photos' do
    let!(:mount_fuji) {Photo.create(descr:'Mount Fuji')}
    scenario 'Lets a user view profile page of a photo' do
      visit '/photos'
      click_link 'Mount Fuji'
      expect(page).to have_content 'Mount Fuji'
      expect(current_path).to eq "/photos/#{mount_fuji.id}"
    end
  end

  context 'Editing photos (signed in)' do
    before {Photo.create descr: 'Mount Fuji'; sign_up('test@example.com', 'password')}
    scenario 'Let a user edit a photo' do
      click_link 'Edit Mount Fuji'
      fill_in 'Description', with: 'Mt Fuji'
      click_button 'Update photo'
      expect(page).to have_content 'Mt Fuji'
      expect(current_path).to eq '/photos'
    end

    scenario 'Does not let you submit a blank description' do
      click_link 'Edit Mount Fuji'
      fill_in 'Description', with: ''
      click_button 'Update photo'
      expect(page).not_to have_css 'h3'
      expect(page).to have_content 'Description cannot be left blank'
    end
  end

  context 'Editing photos (not signed in)' do
    before {Photo.create descr: 'Mount Fuji'}
    scenario 'Does not allow user to edit photos' do
      visit '/photos'
      click_link 'Edit Mount Fuji'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(page).not_to have_content 'Description:'
    end
  end

  context 'Deleting photos' do
    before {Photo.create descr: 'Mount Fuji'; sign_up('test@example.com', 'password')}
    scenario 'Removes a photo when user clicks a delete link' do
      click_link 'Delete Mount Fuji'
      expect(page).not_to have_content 'Mount Fuji'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

  context 'Deleting photos (not signed in)' do
    before {Photo.create descr: 'Mount Fuji'}
    scenario 'Does not allow user to delete photos' do
      visit '/photos'
      click_link 'Delete Mount Fuji'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(page).not_to have_content 'Photo deleted successfully'
    end
  end

end
