require 'rails_helper'
img = Rack::Test::UploadedFile.new('spec/files/pirates1.jpeg', 'image/jpg')

RSpec.feature '<<Pictures>>' do

  before do
    sign_up_1
  end

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
                              caption: 'Nothing here...',
                              image: img)}

    scenario 'viewing all pictures' do
      visit '/pictures'
      expect(page).to have_content 'Pirate Party!'
      expect(page).to have_css "img[src*='pirates1.jpeg']"
      expect(page).not_to have_content 'There are\'nt any pictures here yet.'
    end

    scenario 'viewing individual pictures' do
      visit '/pictures'
      click_link 'Pirate Party!'
      expect(page).to have_content 'Nothing here...'
      expect(current_path).to eq "/pictures/#{pic.id}"
    end

    context 'editing pictures' do
      scenario 'a user may edit their picture' do
        visit '/pictures'
        click_link 'Pirate Party!'
        click_link 'Edit Pirate Party!'
        fill_in 'Title', with: 'No party'
        fill_in 'Caption', with: 'not any more'
        attach_file 'Image', Rails.root.join('spec/files/missing.jpeg')
        click_button 'Update Picture'
        expect(page).to have_content 'No party'
        expect(page).to have_css "img[src*='missing.jpeg']"
      end
      scenario 'a user may not edit anothers picture' do
        click_link 'Sign out'
        sign_up_2
        visit '/pictures'
        click_link 'Pirate Party!'
        expect(page).not_to have_link 'Edit Pirate Party!'
      end
    end

    context 'deleting pictures' do
      scenario 'a user may delete their picture' do
        visit '/pictures'
        click_link 'Pirate Party!'
        click_link 'Delete Pirate Party!'
        expect(page).not_to have_content 'Pirate Party!'
        expect(page).to have_content 'Picture deleted'
      end
      scenario 'a user may not delete anothers picture' do
        click_link 'Sign out'
        sign_up_2
        visit '/pictures'
        click_link 'Pirate Party!'
        expect(page).not_to have_link 'Delete Pirate Party!'
      end
    end
  end

  context 'creating pictures' do
    scenario 'does not accept pictures without a title' do
      visit '/pictures'
      click_link 'Upload a picture...'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end

    scenario 'does not accept pictures without an image' do
      visit '/pictures'
      click_link 'Upload a picture...'
      fill_in 'Title', with: 'Pic'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end
  end

end
