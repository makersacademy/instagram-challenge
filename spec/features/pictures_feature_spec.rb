require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_content 'Upload a picture'
    end
  end

  context 'pictures have been added' do
    scenario 'displays pictures' do
      visit '/pictures/new'
      attach_file 'Picture', Rails.root.join('spec/images/sanj.jpeg')
      fill_in 'Description', with: 'Sanjay!'
      click_button 'Upload picture'
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_content 'No pictures yet'
      expect(page).to have_css 'img.uploaded-pic'
      expect(page).to have_content 'Sanjay!'
    end
  end
end
