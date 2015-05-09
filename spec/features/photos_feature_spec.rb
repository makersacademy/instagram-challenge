require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
    scenario 'add a photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Description', with: "Nando's 4 lyf"
      click_button 'Submit Photo'
      expect(page).to have_content 'Description: Nando\'s 4 lyf'
    end
  end
end