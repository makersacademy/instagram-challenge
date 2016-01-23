require 'rails_helper'

feature '<<Pictures>>' do
  context 'when no pictures have been added' do
    scenario 'it should show prompt to upload an image' do
      visit '/pictures'
      expect(page).to have_content 'There aren\'t any pictures here yet.'
      expect(page).to have_link 'Upload a picture...'
      end

    scenario 'a user may upload a picture' do
      visit '/pictures'
      click_link 'Upload a picture...'
      fill_in 'Title', with: 'Pirate Party!'
      fill_in 'Caption', with: 'Ahoy!'
      attach_file 'Image', Rails.root.join('spec/files/pirates1.jpeg')
      click_button 'Create Picture'
      expect(current_path).to eq '/pictures'
      expect(page).to have_css "img[src*='pirates1.jpeg']"
    end
  end

  context 'when pictures have been added' do

    let!(:pic){Picture.create(title: 'Pirate Party!',
                              caption: 'Nothing here...')}

    scenario 'it should display the pictures' do
      visit '/pictures'
      expect(page).to have_content 'Pirate Party!'
      expect(page).to have_css "img[src*='missing.jpeg']"
      expect(page).not_to have_content 'There are\'nt any pictures here yet.'
    end

    scenario 'a user may view a picture' do
      visit '/pictures'
      click_link 'Pirate Party!'
      expect(page).to have_content 'Nothing here...'
      expect(current_path).to eq "/pictures/#{pic.id}"
    end

    scenario 'a user may edit their picture' do
      visit '/pictures'
      click_link 'Edit Pirate Party!'
      fill_in 'Title', with: 'No party'
      fill_in 'Caption', with: 'not any more'
      attach_file 'Image', Rails.root.join('spec/files/missing.jpeg')
      click_button 'Update Picture'
      expect(page).to have_content 'No party'
      expect(page).to have_css "img[src*='missing.jpeg']"
    end
  end

end
