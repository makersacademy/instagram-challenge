require 'rails_helper'

feature 'pictures' do

    scenario 'link for adding pictures' do
      visit '/pictures'
      expect(page).to have_link 'share a picture'
    end

    scenario 'show all pictures' do
      Picture.create(caption: 'sally')
      visit '/pictures'
      expect(page).to have_content('sally')
    end

    scenario 'user can share a picture' do
      visit '/pictures'
      click_link 'share a picture'
      fill_in 'Caption', with: 'sally'
      click_button 'share picture'
      expect(page).to have_content 'sally'
      expect(current_path).to eq '/pictures'
    end

end
