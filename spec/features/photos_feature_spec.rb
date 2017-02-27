require 'rails_helper'
# require_relative 'web_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content('No photos have been posted yet!')
      expect(page).to have_link('Post a new photo')
    end
  end

  context 'photos have been added' do
    before do
      upload_photo
      @photo_id = Photo.first.id
    end

    scenario 'display photos and its caption' do
      visit '/photos'
      expect(page).to have_css("img[src*='test']")
      expect(page).to have_content('Cooking!')
      expect(page).not_to have_content('No photos have been posted yet!')
    end

    context 'viewing photos' do
      # let!(:cooking){Photo.create(image:'Cooking!')}
        scenario 'lets a user view a photo' do
          # photo_id = Photo.where(caption: 'Cooking!').ids[0]
          img = find(:css, "img[src*='test']")
          img.click
          expect(page).to have_css("img[src*='test']")
          expect(page).to have_content('Cooking!')
          save_and_open_page
          expect(current_path).to eq 'photos/#{@photo.id}'
        end
    end
  end
end
