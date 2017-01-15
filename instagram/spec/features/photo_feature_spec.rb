require 'rails_helper'

feature 'photos' do
  before do
    sign_up
  end

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No one has posted any photos yet...'
      expect(page).to have_link 'Post a photo'
    end
  end
  context 'photos have been added' do
    before do
      post_photo
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

  context 'editing captions' do
    scenario 'clicking edit lets you edit your caption' do
      post_photo
      photo = Photo.find_by(caption: 'My Lunch')
      visit "/photos/#{photo.id}"
      click_link 'Edit'
      fill_in 'Caption', with: 'My disgusting lunch'
      click_button 'Update caption'
      expect(current_path).to eq "/photos/#{photo.id}"
      expect(page).to have_content 'My disgusting lunch'
      expect(page).not_to have_content 'My Lunch'
    end
  end
  context 'deleting photos' do
    scenario 'deletes a photo when user clicks delete link' do
      post_photo
      photo = Photo.find_by(caption: 'My Lunch')
      visit "/photos/#{photo.id}"
      click_link 'Delete photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Photo deleted successfully'
      expect(page).not_to have_content 'My Lunch'
    end
    scenario "you cannot delete someone else's photos" do
      post_photo
      click_link 'Sign out'
      sign_up(email: 'test@test.com')
      click_link 'My Lunch'
      click_link 'Delete photo'
      expect(page).to have_content "You can't delete someone else's photo!"
    end
  end

end
