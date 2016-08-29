require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add Photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(description: 'Selfie')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('Selfie')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      click_link 'Add Photo'
      fill_in 'Description', with: 'Selfie'
      click_button 'Create Photo'
      expect(page).to have_content 'Selfie'
      expect(current_path).to eq '/'
    end
  end

end
