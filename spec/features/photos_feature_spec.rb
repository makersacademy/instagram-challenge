require 'rails_helper'
include UsersHelper

feature 'photos' do

  context 'no photos have been added' do

    scenario 'should display no photos added yet' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end
  end

    scenario 'should display a link to add photos' do
      visit '/'
      expect(page).to have_link 'Add a photo'
    end

  context 'creating photos' do

    before do
      user = build :user
      sign_up user
    end

    scenario 'user must be logged in to post photos' do
      click_link 'Sign out'
      click_link 'Add a photo'
      expect(page).not_to have_button "Create Photo"
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'should take you to a page where you can upload a photo' do
      click_link 'Add a photo'
      expect(current_path).to eq '/photos/new'
    end

    scenario 'should let you upload a photo' do
      click_link 'Add a photo'
      fill_in 'photo_title', with: 'test title'
      attach_file 'photo_image', "spec/features/files/test.jpg"
      click_button "Create Photo"
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'test title'
    end

    scenario 'should have a description of the photo' do
      click_link 'Add a photo'
      fill_in 'photo_title', with: 'test title'
      fill_in 'photo_description', with: 'test description'
      attach_file 'photo_image', "spec/features/files/test.jpg"
      click_button "Create Photo"
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'test description'
    end
  end


end
