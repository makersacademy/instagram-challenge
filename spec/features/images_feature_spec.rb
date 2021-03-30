require 'rails_helper'

feature 'images' do
  before (:each) do
    sign_up
  end
  
  context 'no images have been added' do
    scenario 'Site shows when it has no images' do
      visit '/images'
      expect(page).to have_content "No Images Yet!"
      expect(page).to have_link 'Add an image'
    end

    scenario 'and image can be viewed' do
      add_image
      click_link ('Flower')
      expect(page).to have_content('Flower')
      expect(page).to have_content('Add a comment')
    end

  end

  context 'an image can be uploaded' do
    scenario 'a creates an image post' do
      add_image
      expect(page).to have_content('Flower')
    end
  end

  context 'an image can be deleted' do
    scenario 'a user clicks the delete image button to remove image post and image' do
      add_image
      click_link 'Delete Image'
      expect(page).not_to have_content('Flower')
    end
  end

end
