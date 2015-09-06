require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/photos'
      expect(page).to have_content 'no photos yet'
      expect(page).to have_link 'Add Photo'
    end
  end

  context 'creating photos' do

    scenario 'prompts user to fill out a form, then displays the new photo' do
      sign_in
      click_link "Add Photo"
      fill_in 'Name', with: 'test'
      attach_file 'photo_image', 'spec/asset_specs/photos/photo.jpg'
      click_button 'Create Photo'
      expect(page).not_to have_content 'no photos yet'
      expect(page).to have_content 'test'
      expect(page).to have_selector "img"
    end
  end
  context 'viewing photos' do
    let!(:test_pic){Photo.create(name:'testing_picture')}

    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'testing_picture'
      expect(current_path).to eq("/photos/#{test_pic.id}")
      expect(page).to have_link 'Back to Feed'
    end
  end

  context 'deleting photos' do
    let!(:test_pic){Photo.create(name:'testing_picture')}

    scenario 'removes a photo when a user clicks a delete link' do
      sign_in
      visit '/photos'
      click_link "#{test_pic.name}"
      click_link "Delete #{test_pic.name}"
      expect(page).not_to have_content "#{test_pic.name}"
      expect(page).to have_content 'Photo deleted successfully'
      expect(current_path).to eq("/photos")
    end
  end
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in
  sign_up
  click_link 'Sign out'
  visit('/')
  click_link 'Sign in'
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button 'Log in'
end