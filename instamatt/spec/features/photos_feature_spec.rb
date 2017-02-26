require 'rails_helper'

feature 'photos' do
  context 'no photos exist in database' do
    scenario 'should prompt user to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos have been added - why not be the first?'
      expect(page).to have_link 'Add a photo'
    end
  end
end
