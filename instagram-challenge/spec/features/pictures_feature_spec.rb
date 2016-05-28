require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

  context 'adding a picture' do
    scenario 'prompt user to add a description for the picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image', 'app/assets/images/anime1.jpeg'
      fill_in 'Description', with: 'New picture'
      click_button 'Create Picture'
      expect(page).to have_content 'New picture'
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
end
end
