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
      Image.create(description: 'First picture')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content 'First picture'
      expect(page).not_to have_content 'No images yet'
    end
  end

  context 'adding images' do
    scenario 'prompts user to fill out form, then displays new image' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Description', with: 'First picture'
      click_button 'Create Image'
      expect(page).to have_content 'First picture'
      # expect(page).to have_image
    end
  end
end
