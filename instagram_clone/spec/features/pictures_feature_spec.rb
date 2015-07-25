require 'rails_helper'

feature 'pictures' do
  context 'No pictures added' do
    scenario 'Display prompt to add picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet')
      expect(page).to have_content('Add a picture')
    end
  end

  context 'Pictures added' do
    before do
      Picture.create(url: 'fakepic')
    end

    scenario 'Displays pictures' do
      visit '/pictures'
      expect(page).to have_content('fakepic')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'Adding pictures' do
    scenario 'form to fill in' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Url', with: 'fakepic'
      click_button 'Create Picture'
      expect(page).to have_content 'fakepic'
      expect(current_path).to eq '/pictures'
    end
  end
end