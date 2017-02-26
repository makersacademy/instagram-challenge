require 'rails_helper'
# require_relative 'web_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content('No photos have been posted yet!')
      save_and_open_page
      expect(page).to have_link('Post a new photo')
    end
  end

  context 'photos have been added' do
    before do
      upload_photo
      @photo_id = Photo.first.id
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_css("img[src*='test']")
      expect(page).to have_content('Cooking!')
      expect(page).not_to have_content('No photos have been posted yet!')
    end
  end
end
