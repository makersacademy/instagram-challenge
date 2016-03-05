require 'rails_helper'

# As an user
# So I can share my images
# I want to be able to upload an images

feature 'images' do

  context 'No images have been added yet' do
    scenario 'no images have been uploaded yet' do
      visit '/images'
      expect(page).to have_content 'No images have been uploaded yet!'
      expect(page).to have_content 'Add an Image'
    end
  end

  context 'Images have been added' do
    before do
      Image.create( title: 'Zonsondergang')
    end
    scenario 'images are shown' do
      visit '/images'
      expect(page).to have_content 'Zonsondergang'
    end
  end

  context 'Uploading an image' do
    scenario 'users can add an title for the image' do
      visit '/images'
      click_link 'Add an Image'
      expect(current_path).to eq '/images/new'
      expect(page).to have_content 'Title'
    end
    scenario 'users sees added title on images page' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Title', with: 'Zonsopgang'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Zonsopgang'
    end
  end
end
