require 'rails_helper'

feature 'photo' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'Be the first to post a photo'
      expect(page).to have_link 'Post a photo'
    end
  end
  context 'uploading a photo' do
    scenario 'uploading a photo' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in 'Caption', with: "Luvyababes xx"
      attach_file "Image", Rails.root + 'spec/features/test_images/chase.jpg'
      click_button 'Create Photo'
      expect(page).to have_css("img[src*='chase.jpg']")
      expect(page).to have_content "Luvyababes xx"
    end
  end
end
