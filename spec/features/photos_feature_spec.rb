require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    it 'should display a prompt to post a photo' do
      visit('/photos')
      expect(page).to have_content('No photos have been posted!')
      expect(page).to have_link('Post a photo')
    end
  end

  context 'a photo has been added' do
    before do
      visit('/photos/new')
      fill_in 'Caption', with: 'Travelling'
      attach_file("photo_image", Rails.root + "spec/fixtures/test.jpg")
      click_button('Create Photo')
    end

    it 'should display the photo caption and photo' do
      visit('/photos')
      expect(page).to have_css("img[src*='test']")
      expect(page).to have_content('Travelling')
      expect(page).not_to have_content('No photos have been posted!')
    end
  end

end
