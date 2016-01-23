require 'rails_helper'

feature '<<Pictures>>' do
  context 'when no pictures have been added' do
    scenario 'it should show prompt to upload an image' do
      visit '/pictures'
      expect(page).to have_content 'There aren\'t any pictures here yet.'
      expect(page).to have_link 'Upload a picture...'
      end
  end

  context 'when pictures have been added' do

    before do
      Picture.create(title: 'Pirate Party!')
    end

  scenario 'it should display the pictures' do
    visit '/pictures'
    expect(page).to have_content 'Pirate Party!'
    expect(page).not_to have_content 'There are\'nt any pictures here yet.'
    end
  end

  context 'adding a picture' do
    scenario 'a user may upload a picture' do
      visit '/pictures'
      click_link 'Upload a picture...'
      fill_in 'Title', with: 'Pirate Party!'
      fill_in 'Caption', with: 'Ahoy!'
      attach_file 'Image', Rails.root.join('./spec/files/missing.jpeg')
      click_button 'Create picture'
      expect(current_path).to eq '/pictures'
      expect(page).to have_css "img[src*='missing.jpeg']"
    end
  end

end
