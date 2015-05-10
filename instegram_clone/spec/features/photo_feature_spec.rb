require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a phot'
    end
  end

  context 'Photos have been added' do
    before do
      Photo.create(name: 'First Photo')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('First Photo')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in 'Name', with: 'First Photo'
      click_button 'Create Photo'
      expect(page).to have_content 'First Photo'
      expect(current_path).to eq '/photos'
    end
  end

  context 'uploading a photo' do
    scenario 'user can upload a photo' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in :Name, with: 'Test Photo'
      attach_file('photo[image]', 'spec/files/test_photo.jpg')
      click_button 'Create Photo'
      expect(page.html).to include(%Q(alt=\"Test photo\"))
    end
  end
end