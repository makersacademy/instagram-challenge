require 'rails_helper'

feature 'pictures' do
  context 'if none have been added yet' do
    scenario 'should display a prompt to add pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'uploading your first image' do
    scenario 'adds a single picture to the homepage' do

      visit '/'
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      click_button 'Upload your picture'
      expect(page).to have_content 'McAvoy'
      expect(current_path).to eq '/pictures'
    end
  end
end
