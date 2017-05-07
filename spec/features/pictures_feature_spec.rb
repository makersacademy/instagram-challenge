require 'rails_helper'

feature 'pictures' do

    before do
      sign_up
    end

    scenario 'link for adding pictures' do
      expect(page).to have_link 'share a picture'
    end

    scenario 'show all pictures' do
      create_picture_with_user
      visit '/pictures'
      expect(page).to have_content('sally')
    end

    scenario 'user can share a picture' do
      share_picture
      expect(page).to have_content 'sally'
      expect(current_path).to eq '/pictures'
    end

    scenario 'user can delete pictures' do
      create_picture_with_user
      visit '/pictures'
      click_link 'delete this picture'
      expect(page).not_to have_content 'sally'
      expect(page).to have_content 'picture deleted'
    end

    scenario 'can see who posted a picture' do
      share_picture
      expect(page).to have_content 'kate@kate.com'
    end

end
