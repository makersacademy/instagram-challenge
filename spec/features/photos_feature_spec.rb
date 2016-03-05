require 'rails_helper'

feature 'photos' do
  context 'when no restaurants have been added' do
    scenario 'displays a message that there are no photos' do
      visit '/photos'
      expect(page).to have_content 'Looks like there are no photos yet...'
    end

    scenario 'displays a link to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Post a photo'
    end
  end
end
