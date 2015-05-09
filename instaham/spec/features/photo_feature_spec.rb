require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No ham makes us cry! Click here to add the first photo:'
      expect(page).to have_link 'Add Photo'
    end
  end

  context 'Can add a new message' do
    scenario 'user can add a message to the db' do
      visit '/photos'
      click_link 'Add Photo'
      fill_in 'Message', with: 'My first post'
      click_button 'Add my photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'My first post'
    end
  end

end