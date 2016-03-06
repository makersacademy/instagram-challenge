require 'rails_helper'

feature 'Photos' do
  context 'No photos have been added' do
    scenario 'Displays a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'Photos have been added' do
    before do
      Photo.create(file: 'test.jpg')
    end

    scenario 'Display photos' do
      visit '/photos'
      expect(page).to have_content('test.jpg')
      expect(page).not_to have_content('No photos yet')
    end
  end
end
