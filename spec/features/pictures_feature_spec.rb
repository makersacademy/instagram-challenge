require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do

    before do
      Picture.create(caption: 'Another selfie!')
    end

    it 'should display the added picture' do
      visit '/pictures'
      expect(page).to have_content 'Another selfie!'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'adding pictures' do
    it 'asks user to add a caption to their picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Caption', with: 'Another picture of Tower Bridge'
      click_button 'Create Picture'
      expect(page).to have_content 'Another picture of Tower Bridge'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:picture) { Picture.create(caption: 'Another picture of cats')}
    scenario 'shows the caption for the individual picture' do
      visit '/pictures'
      click_link 'Another picture of cats'
      expect(page).to have_content 'Another picture of cats'
      expect(current_path).to eq("/pictures/#{picture.id}")
    end
  end

end
