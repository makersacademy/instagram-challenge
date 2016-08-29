require 'rails_helper'

feature 'Photos' do

  context 'No photos added' do

    scenario 'displays a prompt to add a photo' do
      visit '/'
      expect(page).to have_link 'Add a photo'
      expect(page).to have_content 'Oh no, it seems there are no photos to display'
    end

  end

  context 'Adding a photo' do

    scenario 'A user uploads a photo' do
      user_sign_up
      visit '/'
      click_link 'Add a photo'
      attach_file "photo_image", Rails.root + 'spec/fixtures/files/wham.jpg'
      fill_in :photo_caption, with: 'WHAM!'
      click_button 'Post photo'
      expect(page).to have_css 'img.photo-image'
      expect(page).to have_content 'WHAM!'
      expect(current_path).to eq '/'
    end

  end

  context 'Editing a photos' do

    scenario 'editing a photos caption' do
      user_sign_up
      add_photo
      click_link 'Edit caption'
      fill_in :photo_caption, with: 'New caption'
      click_button 'Update caption'
      expect(page).to have_content 'New caption'
      expect(current_path).to eq '/'
    end

  end

  context 'Deleting a photo' do

    scenario 'A photo gets deleted' do
      user_sign_up
      add_photo
      click_link 'Delete post'
      expect(page).not_to have_css 'img.photo-image'
    end

  end

end
