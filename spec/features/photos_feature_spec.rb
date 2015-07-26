require 'rails_helper'

feature 'Images' do
  context 'when no photos have been added' do
    scenario 'the user should be prompt to add photos' do
      visit '/images'
      expect(page).to have_content 'No images available'
      expect(page).to have_link 'Upload image'
    end
  end
end
