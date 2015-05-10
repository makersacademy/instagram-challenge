require 'rails_helper'
require 'photo_helper'
require 'user_helper'

include PhotoSpecHelpers
include UserSpecHelpers

feature 'As a user on the homepage' do

  context 'when there are no photos to show' do

    scenario 'I am presented with a photo upload form' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_button 'Create Photo'
    end

    scenario 'I can upload a photo with a caption' do
      sign_up_and_log_in
      visit '/photos'
      fill_in 'Caption', with: 'Here is my fish!'
      attach_file('Image', 'spec/files/fish.jpg')
      click_button('Create Photo')
      expect(page).to have_xpath("//img[contains(@src, 'fish.jpg')]")
    end

  end

  context 'when photos have been uploaded' do

    before do
      sign_up_and_log_in
      upload_photo
    end

    scenario 'I can see the photos on the page' do
      visit '/photos'
      expect(page).to have_content('Here is my fish')
      expect(page).not_to have_content('No photos yet')
    end

    scenario 'I can see the username of the person who posted the photo' do
      visit '/photos'
      expect(page).to have_content('testname123')
    end

    scenario 'I can click on a photo to see it bigger' do
      visit '/photos'
      find(:xpath, "//img[contains(@src, 'fish.jpg')]/..").click
      expect(page).to have_xpath("//img[contains(@src, 'fish.jpg')]")
    end

    scenario 'I can add a comment' do
      visit '/photos'
      fill_in 'Content', with: 'Nice picture!'
      click_button 'Create Comment'
      expect(page).to have_content('Nice picture!')
    end

    scenario 'I can like a photo' do
      visit '/photos'
      click_button 'Create Like'
      expect(page).to have_content('1 like')
    end

    scenario 'I can unlike a photo I have already liked' do
      visit '/photos'
      click_button 'Create Like'
      click_link 'Unlike'
      expect(page).to have_content('0 likes')
    end

  end

end