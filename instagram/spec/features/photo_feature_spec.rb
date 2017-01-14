require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No one has posted any photos yet...'
      expect(page).to have_link 'Post a photo'
    end
  end
  context 'photos have been added' do
    before do
      Photo.create(caption: 'My Lunch')
    end

    scenario 'display pictures' do
      visit '/photos'
      expect(page).to have_content 'My Lunch'
      expect(page).not_to have_content 'No one has posted any photos yet...'
    end
  end

  context 'posting photos' do
    scenario 'prompts user to fill in caption, add a photo, then displays the photo' do
      post_photo
      expect(page).to have_css("img[src*='my_lunch']")
      expect(page).to have_content 'My Lunch'
      expect(current_path).to eq photos_path
    end
  end

  context 'viewing photos' do
    scenario 'clicking a caption takes you to an individual page' do
      post_photo
      photo = Photo.find_by(caption: 'My Lunch')
      visit '/photos'
      click_link 'My Lunch'
      expect(page).to have_css("img[src*='my_lunch']")
      expect(page).to have_content "My Lunch"
      expect(current_path).to eq "/photos/#{photo.id}"
    end
  end
end
