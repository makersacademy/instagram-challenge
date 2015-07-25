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
      Picture.create(name: 'garden', description: 'raspberries')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'raspberries'
      expect(page).not_to have_content('No photos yet')
    end
  end


  context 'creating new pictures' do
    scenario 'user prompted to fill out form, upload picture, which displays new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Image','spec/features/rasp.jpg'
      fill_in 'Name', with: 'garden'
      fill_in 'Description', with: 'raspberries'
      click_link 'Upload picture'
      expect(page).to have_css('img[src="rasp.jpg"]')
      expect(page).to have_content('garden')
      expect(current_path).to eq '/pictures'
    end
  end

end
