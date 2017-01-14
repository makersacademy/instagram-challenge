require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo!'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(description: 'A fun trip to the beach!')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('A fun trip to the beach!')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'uploading a photo' do
    scenario 'prompts user to fill in a description (for now), then desplays it' do
      visit '/photos'
      click_link 'Add a photo!'
      fill_in 'Description', with: "A fun trip to the beach!"
      click_button 'Upload photo'
      expect(page).to have_content 'A fun trip to the beach!'
      expect(current_path).to eq '/photos'
    end
  end
end
