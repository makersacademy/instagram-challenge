require 'rails_helper'

feature 'Images' do
  context 'no images have been uploaded' do
    scenario 'should display a prompt to upload an image' do
      visit '/photos'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload a new photo'
    end
  end

  context 'images have been added' do
    before do
      Photo.create(title: 'Tomato')
    end

    scenario 'display images' do
      visit '/photos'
      expect(page).to have_content('Tomato')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'viewing photos' do
    let!(:tomato) { Photo.create(title:'Tomato') }
    scenario 'titles are links' do
      visit '/photos'
      click_link 'Tomato'
      expect(page).to have_content 'Tomato'
      expect(current_path).to eq "/photos/#{tomato.id}"
    end
  end

  context 'uploading images' do
    before(:each) do
      user = build :user
      sign_up(user)
    end

    scenario 'user can upload image with title' do
      visit '/photos'
      click_link 'Upload a new photo'
      fill_in 'Title', with: 'Tomato'
      attach_file("photo[image]", "spec/asset_specs/photos/tomato.jpg")
      click_button 'Upload'
      expect(page).to have_selector 'img'
      expect(page).to have_css ('img[src*="tomato.jpg"]')
    end

     xscenario 'image does not display if no image uploaded' do
      visit '/photos'
      click_link 'Upload a new photo'
      fill_in 'Title', with: 'Tomato'
      click_button 'Upload'
      expect(page).not_to have_selector 'img'
      expect(page).to have_content 'Please upload an image'
    end

  end

  scenario 'user must be signed in to upload photo' do
    visit '/photos'
    click_link 'Upload a new photo'
    expect(page).to have_content 'Sign in'
  end

  context 'editing images' do

    before(:each) do
      user = build :user
      sign_up(user)
      upload_photo
    end

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Tomato'
      click_link 'Edit'
      fill_in 'Title', with: 'Poetic tomatoes'
      click_button 'Update Photo'
      expect(page).to have_content 'Poetic tomatoes'
      expect(current_path).to eq '/photos'
    end

  end

  context 'deleting images' do

    before(:each) do
      user = build :user
      sign_up(user)
      upload_photo
    end

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Tomato'
      click_link 'Delete'
      expect(page).not_to have_content 'Tomato'
      expect(page).to have_content 'Photo deleted successfully'
    end

   scenario 'user can only delete own images' do
      user_2 = build(:user_2)
      visit '/'
      click_link 'Sign out'
      visit '/users/sign_up'
      sign_up(user_2)
      visit '/photos'
      click_link 'Tomato'
      expect(page).not_to have_link 'Delete'
    end
  end


end