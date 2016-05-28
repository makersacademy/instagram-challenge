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

  context 'photos added' do

    scenario 'can add a photo' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in :Location, with: 'Dolores Park'
      fill_in :Image, with: 'sss'
      fill_in :Description, with: 'Such a nice day'
      click_button 'Post'
      expect(current_path).to eq '/photos'
    end

    scenario 'added photo displays on /photos' do
      visit '/photos'
      click_link 'Post a photo'
      fill_in :Location, with: 'Dolores Park'
      fill_in :Image, with: 'sss'
      fill_in :Description, with: 'Such a nice day'
      click_button 'Post'
      expect(page).to have_content 'Dolores Park'
      expect(page).to have_content 'Such a nice day'
    end

  end
end
