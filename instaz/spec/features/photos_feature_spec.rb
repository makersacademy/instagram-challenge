require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/photos'
      expect(page).to have_content 'No photos yet!'
      expect(page).to have_link 'Upload Image'
    end
  end
  
  context 'photos have been added' do
    before do   
      file_path = "./app/assets/images/cat.jpg"
      visit '/photos'
      click_link 'Upload Image'
      fill_in 'Description', with: 'grumpy cat'
      attach_file "photo_image", file_path
      click_button 'Upload'
    end
    
    scenario 'display photo ' do
      visit '/'
      expect(page).to have_content('grumpy cat')
      expect(page).not_to have_content('No photos yet!')
    end
  end
end