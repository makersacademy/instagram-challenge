require 'rails_helper'
include UsersHelper
include PhotosHelper

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
      create_photo
      expect(current_path).to eq '/photos'
      expect(page).to have_xpath("//img[contains(@src,'test.jpg')]")
    end

    scenario 'should have a description of the photo' do
      create_photo
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Test description'
    end
  end

  context 'deleting photos' do

    before do
      user = build :user
      sign_up user
      create_photo
    end

    scenario 'user can delete photos that they have created' do
      expect(page).to have_link 'Delete this photo'
      click_link 'Delete this photo'
      expect(page).not_to have_link 'Delete this photo'
    end

    scenario 'users can only delete photos that they have posted' do
      expect(page).to have_link 'Delete this photo'
      click_link 'Sign out'
      user2 = build(:user, email: 'user2@example.com')
      sign_up user2
      expect(page).not_to have_link 'Delete this photo'
    end

  end

end
