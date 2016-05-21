require 'rails_helper'

feature 'images' do

  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    before do
      upload_image
    end

    scenario 'displays images and captions' do
      visit '/images'
      expect(page).to have_content "Galaxy"
      expect(page).not_to have_content "No images yet"
      # expect(page).to have_css ""     #where's the image?
    end
  end
end