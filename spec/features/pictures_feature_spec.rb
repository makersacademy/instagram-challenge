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
      Picture.create(caption: 'Another selfie!', image: 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg')
    end

    it 'should display the added picture' do
      visit '/pictures'
      expect(page).to have_content 'Another selfie!'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'adding pictures' do
    before do
      Picture.create(caption: 'Another selfie!', image: 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg')
    end

    it 'asks user to add a caption to their picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Caption', with: 'Another selfie!'
      click_button 'Create Picture'
      expect(page).to have_content 'Another selfie!'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:picture) { Picture.create(caption: 'Another picture of cats', image: 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg')}
    scenario 'shows the caption for the individual picture' do
      visit '/pictures'
      click_link 'Another picture of cats'
      expect(page).to have_content 'Another picture of cats'
      expect(current_path).to eq("/pictures/#{picture.id}")
    end
  end

  context 'editing pictures' do
    before do
      Picture.create(caption: 'Another selfie!', image: 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg')
    end

    it 'allows user to edit a picture' do
      visit '/pictures'
      click_link 'Edit Picture'
      fill_in 'Caption', with: 'Still a selfie'
      click_button 'Update Picture'
      expect(page).to have_content 'Still a selfie'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do
    before do
      Picture.create(caption: 'Another selfie!', image: 'https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg')
    end

    it 'allows user to delete a picture' do
      visit '/pictures'
      click_link 'Delete Picture'
      expect(page).not_to have_content 'Another selfie!'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end
