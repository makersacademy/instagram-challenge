require 'rails_helper'

feature 'images' do

  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(caption: 'Test Caption')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content 'Test Caption'
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'adding images' do
    scenario 'prompts user to upload an image, then displays the new image' do
      visit '/images'
      click_link 'Upload an image'
      attach_file 'Upload', "spec/test.png"
      fill_in 'Caption', with: 'Test Caption'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
      expect(page).to have_selector("img")
    end
  end
end
