require 'rails_helper'

feature 'photos'
  context 'no photos in feed' do

    scenario 'displays button to post a photo' do
      visit '/photos'
      expect(page).to have_content 'Post a photo'
    end

    scenario "displays 'no photos to show'" do
      visit '/photos'
      expect(page).to have_content 'No photos to show :('
    end


  end
