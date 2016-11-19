require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content('No images yet')
      expect(page).to have_link('Add an image')
    end
  end

  context 'images have been added' do
    before do
      Image.create(description: 'Sunday')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content('Sunday')
      expect(page).not_to have_content('No images yet')
    end
  end
end
