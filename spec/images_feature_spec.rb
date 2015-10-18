require 'rails_helper'

feature 'images' do
  context 'no images have been added yet' do
    scenario 'It should have a prompt to add an image' do
      visit '/images'
      expect(page).to have_link 'Add an Image'
    end
  end
  context 'images have been added' do
    before do
      Image.create(name: 'postcard')
    end
    scenario 'images are displayed' do
      visit '/images'
      expect(page).to have_content('postcard')
      expect(page).not_to have_content('No Images Added yet')
    end
  end
  context 'Create an Image' do
    scenario 'prompts a user to fill out a form to add an image' do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Name', with: 'postcard'
      click_button 'Create Image'
      expect(page).to have_content('postcard')
      expect(current_path).to eq('/images')
    end
  end
  context 'Viewing an Image' do
    before do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Name', with: 'breakfast'
      page.attach_file 'image[image]', 'spec/assets/images/dom-s-eatery.jpg'
      click_button 'Create Image'
    end
    scenario 'lets a user view an image' do
      visit '/images'
      click_link 'breakfast'
      expect(page).to have_content('breakfast')
      expect(page).to have_selector('img')
    end
  end
  context 'Editing an Image' do
    before do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Name', with: 'breakfast'
      page.attach_file 'image[image]', 'spec/assets/images/dom-s-eatery.jpg'
      click_button 'Create Image'
    end
    scenario 'let a user edit an image' do
      visit '/images'
      click_link 'Edit breakfast'
      fill_in 'Name', with: 'My Breakfast'
      click_button 'Update Image'
      expect(page).to have_content('My Breakfast')
      expect(current_path).to eq('/images')
    end
  end
  context 'Can delete an Image' do
    before do
      visit '/images'
      click_link 'Add an Image'
      fill_in 'Name', with: 'breakfast'
      page.attach_file 'image[image]', 'spec/assets/images/dom-s-eatery.jpg'
      click_button 'Create Image'
    end
    scenario 'let a user delete an image' do
      visit '/images'
      click_link 'Delete breakfast'
      expect(page).not_to have_content('breakfast')
      expect(page).to have_content('Image deleted successfully')
    end
  end
end
