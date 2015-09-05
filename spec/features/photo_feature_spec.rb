require 'rails_helper'

feature 'photos' do
  context 'no photos have ben added' do
    scenario 'displays prompt to add a photo' do
      visit photos_path
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end
