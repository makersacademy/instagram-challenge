require 'rails_helper'

feature 'photos' do
  context 'no photos added' do
    scenario 'no photos have been added' do
      visit '/'
      sign_up 
      expect(page).to have_content 'no photos added'
      expect(page).to have_link 'Upload A Photo'
    end
  end
  
  context 'photos can be created' do
    scenario 'creating a photo' do
      Photo.create(description: 'TESTDESC')
      visit '/' 
      expect(page).to have_content 'TESTDESC'
    end

      scenario 'users can upload an image using the form' do
      visit '/'
      sign_up 
      click_link 'Upload A Photo'
      attach_file "photo[image]", "spec/asset_specs/photos/Elephant.jpg"
      fill_in 'Description', with: 'test image of elephant'
      click_button 'Create Photo'
      expect(page).to have_content 'test image of elephant'
      expect(page).to have_selector("img")
    end
  end
  
end

