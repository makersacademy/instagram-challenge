require 'rails_helper'

feature 'photos' do
  before do
    @user = create(:user)
    @user2 = create(:user, username: 'fake2', email: 'fake2@fakemail.com')
  end
  
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet!'
      expect(page).to have_link 'Upload Image'
    end
  end
  
  context 'adding a photo' do
    scenario 'prompts user to fill out a form, then displays the photo' do  
      login_as @user 
      file_path = "./app/assets/images/cat.jpg"
      visit '/'
      click_link 'Upload Image'
      fill_in 'Description', with: 'grumpy cat'
      attach_file "photo_image", file_path
      click_button 'Upload'
      expect(page).to have_content('grumpy cat')
      expect(page).not_to have_content('No photos yet!')
    end
    
    scenario 'a user that is not signed in cannot upload a picture' do
      visit '/'
      click_link 'Upload Image'
      expect(current_path).not_to eq '/photos/new'
    end
  end
  
  context 'viewing photos' do
    before do 
      login_as @user
      add_photo 
    end
    
    scenario 'lets a user view a photo' do
      visit '/'
      click_link 'Grumpy cat'
      expect(page).to have_content 'Grumpy cat'
      expect(current_path).to eq "/photos/#{Photo.find_by(name: 'Grumpy cat').id}"
    end
  end
  
  context 'deleting photos' do
    before do 
      login_as @user
      add_photo 
    end
    
    scenario 'removes photo when it is deleted only by the user that uploaded it' do
      visit '/'
      click_link 'Grumpy cat'
      click_link 'Delete photo'
      expect(page).to have_content 'Photo successfully deleted'
    end
    
    scenario 'deos not delete a photo if it is not created by that user' do
      login_as @user2
      visit '/'
      click_link 'Grumpy cat'
      expect(page).not_to have_content 'Delete photo'
    end
  end
  
  context 'viewing a single users photos' do
    before do 
      login_as @user
      add_photo 
    end
    
    scenario 'should see the photos a user has added' do
      first(:link, 'fakeuser').click
      expect(current_path).to eq "/users/#{User.find_by(username: 'fakeuser').id}/photos"
    end
    
  end
end