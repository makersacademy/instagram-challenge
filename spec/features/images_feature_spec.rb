require 'rails_helper'

feature 'images' do

  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'restaurants have been added' do
    before do
      Image.create
    end

    scenario 'display images' do
      visit '/images'
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'adding images' do
    scenario 'prompts user to upload an image, then displays the new image' do
      visit '/images'
      click_link 'Upload an image'
      click_button 'Upload'
      expect(current_path).to eq '/images'
    end
  end
end
