require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'show display a button to upload photos' do
      visit '/photos'
      expect(page).to have_content 'No Photos Added'
      expect(page).to have_content 'Upload a Photo'
    end
  end
end
