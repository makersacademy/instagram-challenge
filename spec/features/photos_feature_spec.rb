require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to post a photo' do
      visit('/photos')
      expect(page).to have_content('No photos have been posted!')
      expect(page).to have_link('Post a Photo')
    end
  end

  context 'a photo has been added' do
    before do
      add_photo
    end

    scenario 'should display the photo caption and photo' do
      visit('/photos')
      expect(page).to have_css("img[src*='test']")
      expect(page).to have_content('Travelling')
      expect(page).not_to have_content('No photos have been posted!')
    end
  end

  context 'deleting a photo' do
    before do
      add_photo
    end

    scenario 'removes a photo when a user clicks a delete button' do
      visit('/photos')
      click_link 'Delete Photo'
      expect(page).to have_content('No photos have been posted!')
      expect(page).not_to have_content('Travelling')
    end
  end

end
