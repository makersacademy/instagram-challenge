require 'rails_helper'
require_relative 'helpers/session_helpers'
include SessionHelpers

feature 'Pictures' do

  context 'no pictures have been added' do
    scenario 'should ask user to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures added yet"
      expect(page).to have_content "Add a picture"
    end
  end

  context 'picture have been added' do
    scenario 'and displayed on the homepage' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_content 'My lovely Iceland'
      expect(page).to have_css('img[alt="Iceland"]')
    end
  end

  context 'editing picture' do
    scenario 'user need to sing in to edit the picture' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_content 'My lovely Iceland'
      click_link 'Sign out'
      expect(page).not_to have_content 'Edit description'
    end

    scenario 'non creator cannot edit picture\'s description' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_content 'My lovely Iceland'
      click_link 'Sign out'
      sign_up('bob@bob.com', '22222222', '22222222')
      click_link 'Edit description'
      expect(page).to have_content 'You can only edit description of a picture that you have created'
    end

    scenario 'only creator can edit picture\'s description' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_content 'My lovely Iceland'
      click_link 'Edit description'
      fill_in 'Description', with: 'My lovely Iceland July 2014'
      click_button 'Update Picture'
      expect(page).to have_content 'My lovely Iceland July 2014'
    end
  end

  context 'deleting picture' do
    scenario 'user need to sing in to delete the picture' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_css('img[alt="Iceland"]')
      click_link 'Sign out'
      expect(page).not_to have_content 'Delete picture'
    end

    scenario 'non creator cannot delete the picture' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_css('img[alt="Iceland"]')
      click_link 'Sign out'
      sign_up('bob@bob.com', '22222222', '22222222')
      click_link 'Delete picture'
      expect(page).to have_content 'You can only delete a pictures that you have created'
    end
     scenario 'only creator can delete the picture' do
      sign_up('test@test.com', '11111111', '11111111')
      attach_picture
      expect(page).to have_css('img[alt="Iceland"]')
      click_link 'Delete picture'
      expect(page).not_to have_css('img[alt="Iceland"]')
    end
  end
end