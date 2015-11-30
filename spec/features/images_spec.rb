require 'rails_helper'

feature 'restaurants' do

  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(name: 'KFC', url: '111', description: 'whut')
    end

    scenario 'displays the images' do
      visit '/images'
      expect(page).to have_content('KFC')
      expect(page).to have_content('whut')
      expect(page).not_to have_content('No images yet')
    end
  end
