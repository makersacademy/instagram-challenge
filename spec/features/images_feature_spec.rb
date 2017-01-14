require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'Site shows when it has no images' do
      visit '/images'
      expect(page).to have_content "No Images Yet!"
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(title: 'Flower')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content('Flower')
      expect(page).not_to have_content('No Images Yet!')
    end
  end
end
