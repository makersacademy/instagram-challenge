require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a  photo' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end
