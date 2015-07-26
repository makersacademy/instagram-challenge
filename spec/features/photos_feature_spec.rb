require 'rails_helper'

feature 'photos' do
  
  before do
    @user = User.create email: 'natso@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as @user
  end

  context 'no photos have been added' do
    scenario 'prompts user to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Upload a photo'
    end
  end

  context 'adding a new photo' do
  	scenario 'allows user to upload a photo' do
      visit '/'
      click_link 'Upload a photo'
      fill_in 'Description', with: 'Instrumental'
      attach_file 'Image', 'spec/fixtures/files/gramophone.png'
      click_button 'Create Photo'
      expect(page).to have_content 'Instrumental'
      expect(page).not_to have_content 'No photos yet'
      expect(page).to have_xpath("//img[contains(@src, 'thumb/gramophone.png')]")
    end

    scenario 'photo must be provided' do
      visit '/'
      click_link 'Upload a photo'
      fill_in 'Description', with: 'Instrumental'
      click_button 'Create Photo'
      expect(page).not_to have_content 'Instrumental'
      expect(page).to have_content('Please choose an image')
    end

    scenario 'denied if not logged in' do
      logout
      visit '/'
      expect(page).not_to have_selector(:link_or_button, 'Upload a photo')
    end
  end

  context 'viewing photos' do
  	let!(:gram) { Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png') }
    scenario 'allows user to view full-size photos' do
      visit '/'
      find('img').click
      expect(page).to have_xpath("//img[contains(@src, 'spec/fixtures/files/gramophone.png')]")
    end
  end

  context 'deleting photos' do

    before do
      Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png', user_id: @user.id)
    end

    scenario 'removes photo when owner clicks delete link' do
      visit '/'
      click_link 'Delete photo'
      expect(page).not_to have_xpath("//img[contains(@src, 'thumb/gramophone.png')]")
      expect(page).to have_content 'Photo removed successfully'
    end
  end
end