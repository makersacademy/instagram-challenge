require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display message "no photos on your feed"' do
      visit photos_path
      expect(page).to have_content 'no photos on your feed'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos can be added and displayed' do

    scenario 'add and display photos' do
      visit photos_path
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lazy cat'
      attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
      click_button "Create Photo"
      expect(page).to have_content 'lazy cat'
      expect(page).not_to have_content 'no photos on your feed'
      expect(page).to have_selector("img")
    end

    scenario 'cannot add a photo without an image' do
      visit photos_path
      click_link 'Add a photo'
      fill_in 'Caption', with: 'lazy cat'
      click_button "Create Photo"
      expect(page).to have_content 'photo cannot be blank'
    end

    scenario 'cannot add a photo without a caption' do
      visit photos_path
      click_link 'Add a photo'
      attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
      click_button "Create Photo"
      expect(page).to have_content 'Caption can\'t be blank'
    end
  end

end