require 'rails_helper'

feature 'photos' do

  context 'no photo have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'adding photo' do

    scenario 'should display a photo and his title' do
      visit '/photos'
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: 'Awesome see'

      click_button 'Add photo'
      expect(page).to have_content 'Awesome see'
      expect(page).to have_css('img[src*="sea.jpg"]')
    end

  end



end