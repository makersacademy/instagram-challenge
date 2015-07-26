require 'rails_helper'

feature 'restaurants' do
  context 'no photos have been added' do
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Upload a photo'
    end
  end
end
