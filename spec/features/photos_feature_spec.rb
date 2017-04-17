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
      Photo.create(name: 'First Photo')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('First Photo')
      expect(page).not_to have_content('No photos yet')
    end
  end
end
