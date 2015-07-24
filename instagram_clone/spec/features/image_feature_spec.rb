require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload an image'
    end
  end
end