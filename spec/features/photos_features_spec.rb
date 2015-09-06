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
      add_picture
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
    scenario 'removes a photo when the owner clicks delete link' do
      sign_in
      add_picture
      visit '/photos'
      click_link "test"
      click_link "Delete test"
      expect(page).not_to have_content "test"
      expect(page).to have_content 'Photo deleted successfully'
      expect(current_path).to eq("/photos")
    end
  end
  scenario 'does not remove photo when not the owner' do
      sign_up
      add_picture
      click_link 'Sign out'

       sign_up 'user_two'
      visit '/photos'
      click_link "test"
      click_link "Delete test"
      expect(page).to have_content "test"
      expect(page).not_to have_content 'Photo deleted successfully'
      expect(page).to have_content 'You cannot delete this picture!'
  end
end

def add_picture
  click_link "Add Photo"
  fill_in 'Name', with: 'test'
  attach_file 'photo_image', 'spec/asset_specs/photos/photo.jpg'
  click_button 'Create Photo'
end

def sign_up user='test'
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: "#{user}@example.com")
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in user='test'
  sign_up user
  click_link 'Sign out'
  visit('/')
  click_link 'Sign in'
  fill_in('Email', with: "#{user}@example.com")
  fill_in('Password', with: 'testtest')
  click_button 'Log in'
end

