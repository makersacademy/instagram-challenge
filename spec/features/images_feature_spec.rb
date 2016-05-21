require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add an photo'
    end
  end

  context 'photos have been added' do
    before do
      upload_photo
    end

    scenario 'displays photos and captions' do
      visit '/photos'
      expect(page).to have_content "Galaxy"
      expect(page).not_to have_content "No photos yet"
      expect(page).to have_css "img[src*='night_sky.jpg']"
      expect(current_path).to eq '/photos'
      #Is this the right way to expect an image?
    end
  end
end