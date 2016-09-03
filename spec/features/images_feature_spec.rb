require 'rails_helper'

feature 'Images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit images_path
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do

    before do
      Image.create(title: 'Mufasa')
    end

    scenario 'display title of image' do
      visit '/images'
      expect(page).to have_content('Mufasa')
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'Creating a post' do
    scenario 'add a picture and title' do
      visit '/'
      click_link 'Add an image'
      attach_file('Image', "spec/files/images/Mufasa.jpg")
      fill_in 'Title', with: 'Mufasa'
      click_button 'Create Image'
      expect(page).to have_content('Mufasa')
      expect(page).to have_css("img[src*='Mufasa.jpg']")
    end
  end
end
