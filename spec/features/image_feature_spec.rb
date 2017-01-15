require 'rails_helper'

feature 'photos' do
  context 'No images have been added' do
    scenario 'Should display a prompt to add an image' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end
