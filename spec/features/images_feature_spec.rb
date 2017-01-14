require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'Site shows when it has no images' do
      visit '/images'
      expect(page).to have_content "No Images Yet!"
      expect(page).to have_link 'Add an image'
    end
  end

  context 'an image can be uploaded' do
    scenario 'a creates an image post' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Title', with: "Flower"
      attach_file("image_image", Rails.root + "spec/features/files/flower.jpg")
      click_button 'Upload Image'
      expect(page).to have_content('Flower')
    end
  end

  context 'an image can be deleted' do
    scenario 'a user clicks the delete image button to remove image post and image' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Title', with: "Flower"
      attach_file("image_image", Rails.root + "spec/features/files/flower.jpg")
      click_button 'Upload Image'
      click_link 'Delete Image'
      expect(page).not_to have_content('Flower')
    end
  end

end
