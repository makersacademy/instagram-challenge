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
end
