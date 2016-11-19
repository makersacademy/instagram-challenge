require 'rails_helper'

feature 'pictures' do
  context 'no pictures should have been added' do
    scenario 'prompt for adding pictures should be displayed' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before :each do
      Picture.create(description: 'Cat Snaps')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'Cat Snaps'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'adding pictures' do
    scenario 'user fills out form, then picture is displayed' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Description', with: 'Cute Cat'
      click_button 'Create Picture'
      expect(page).to have_content 'Cute Cat'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:cat) { Picture.create(description: 'Best Cat')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'Best Cat'
      expect(page).to have_content 'Best Cat'
      expect(current_path).to eq "/pictures/#{cat.id}"
    end
  end

end
