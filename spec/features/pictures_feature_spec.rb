require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_content 'Upload a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description:'My cat wearing my hat',
                     image:'storage/imgs/cat_in_hat.jpg')
    end

    scenario 'display picture' do
      visit '/pictures'
      expect(page).to have_content('My cat wearing my hat')
      expect(page).not_to have_content('No pictures added yet')
    end

  end

  context 'uploading pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Upload a picture'
      fill_in 'Description', with: 'My cat in a hat'
      click_button 'Upload Picture'
      expect(page).to have_content 'My cat in a hat'
      expect(current_path).to eq '/pictures'
    end
  end

end
