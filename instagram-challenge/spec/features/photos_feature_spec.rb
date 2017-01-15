require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should prompt user to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_content 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(caption: 'My cat is fluffy')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('My cat is fluffy')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to add their photo with a caption, then displays the photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Caption', with: 'My cat is fluffy'
      click_button 'Create Photo'
      expect(page).to have_content 'My cat is fluffy'
      expect(current_path).to eq '/photos'
    end
  end

end
