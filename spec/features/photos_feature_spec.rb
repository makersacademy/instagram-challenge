require 'rails_helper'

feature 'photo' do
  before do
    sign_up
    visit '/photos'
  end
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      expect(page).to have_content 'Be the first to post a photo'
      expect(page).to have_link 'Post a photo'
    end
  end
  context 'uploading a photo' do
    before do
      click_link 'Post a photo'
      fill_in 'Caption', with: "Luvyababes xx"
      attach_file "Image", Rails.root + 'spec/features/test_images/chase.jpg'
      click_button 'Create Photo'
    end
    scenario 'uploading a photo' do
      expect(page).to have_css("img[src*='chase.jpg']")
      expect(page).to have_content "Luvyababes xx"
    end
    scenario 'deleting a photo' do
      click_link 'Delete post'
      expect(page).not_to have_css("img[src*='chase.jpg']")
      expect(page).not_to have_content "Luvyababes xx"
    end
  end
end
