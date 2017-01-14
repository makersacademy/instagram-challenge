require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should prompt user to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_content 'Add a photo'
    end
  end
end
