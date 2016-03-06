require 'rails_helper'

feature 'Photos' do
  context 'No photos have been added' do
    scenario 'Displays a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end
