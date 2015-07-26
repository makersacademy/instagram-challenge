require 'rails_helper'

feature 'Images' do

  context 'when no images have been added' do
    scenario 'the user should be prompt to add photos' do
      visit '/images'
      expect(page).to have_content 'No images available'
      expect(page).to have_link 'Upload Image'
    end
  end

  context 'when uploading images' do
    scenario 'images can be added' do
      visit '/images'
      click_link 'Upload Image'
      expect(current_path).to eq '/images/new'
      attach_file 'Image', Rails.root.join('spec/images/banana.jpeg')
      fill_in 'Description', with: 'Banana'
      click_button 'Upload Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Banana'
    end
  end
  
end
