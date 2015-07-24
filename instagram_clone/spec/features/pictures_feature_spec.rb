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
    scenario 'with a description' do
      visit '/'
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
      expect(page).to have_css("img[src*='McAvoy.jpg']")
      expect(page).to have_content 'Bae'
      expect(current_path).to eq '/pictures'
    end

    scenario 'does not let you upload without a description' do
      visit '/'
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      click_button 'Upload your picture'
      expect(page).to have_content 'error'
    end
  end

  context 'deleting pictures' do
    before do
      visit '/'
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
    end

    scenario 'will remove photo when user clicks delete' do
      click_link 'Delete Bae'
      expect(page).not_to have_content 'Bae'
      expect(page).not_to have_css("img[src*='McAvoy.jpg']")
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
