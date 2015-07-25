require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet!'
      expect(page).to have_link 'Upload Image'
    end
  end
  
  context 'adding a photo' do
    scenario 'prompts user to fill out a form, then displays the photo' do   
      file_path = "./app/assets/images/cat.jpg"
      visit '/'
      click_link 'Upload Image'
      fill_in 'Description', with: 'grumpy cat'
      attach_file "photo_image", file_path
      click_button 'Upload'
      expect(page).to have_content('grumpy cat')
      expect(page).not_to have_content('No photos yet!')
    end
  end
  
  context 'viewing photos' do
    before { add_photo }
    
    scenario 'lets a user view a photo' do
      visit '/'
      click_link 'Grumpy cat'
      expect(page).to have_content 'Grumpy cat'
      expect(current_path).to eq "/photos/#{Photo.find_by(name: 'Grumpy cat').id}"
    end
  end
  
  context 'deleting photos' do
    before { add_photo }
    
    scenario 'removes photo when it is deleted' do
      visit '/'
      click_link 'Grumpy cat'
      click_link 'Delete photo'
      expect(page).to have_content 'Photo successfully deleted'
    end
  end
end