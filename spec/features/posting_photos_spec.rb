require 'rails_helper'

feature 'photos' do
  context 'no photos added' do
    scenario 'no photos have been added' do
      visit '/'
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

    scenario 'users can fill in a description for the image' do
      visit '/'
      click_link 'Upload A Photo'
      fill_in 'Description', with: 'test description'
      click_button 'Create Photo'
      expect(current_path).to eq '/'
      expect(page).to have_content 'test description'
    end
  end
  
end

