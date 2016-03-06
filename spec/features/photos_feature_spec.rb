require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a link to add a photo' do
      sign_up
      visit '/photos'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'adding and deleting photos' do
    before do
      sign_up
    end

    scenario 'user can upload and view a photo' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', Rails.root.join('spec','features','img.jpg')
      click_button 'Create Photo'
      expect(page).to have_css("img[src*='img.jpg']")
    end

    scenario 'removes a photo when a user clicks a delete link' do
      add_photo
      visit '/'
      click_link 'Delete photo'
      expect(page).not_to have_css("img[src*='img.jpg']")
      expect(page).to have_content 'Photo deleted successfully'
    end
  end
end
