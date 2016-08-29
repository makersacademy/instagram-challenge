require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
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

end
