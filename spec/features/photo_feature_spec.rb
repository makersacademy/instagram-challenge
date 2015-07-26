require 'rails_helper'

feature 'restaurants' do
  context 'no photos have been added' do
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Upload a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'Best Burger')
    end
    scenario 'display title of photos' do
      visit '/photos'
      expect(page).to have_content 'Best Burger'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'adding photos' do
    scenario 'Adding title' do
      visit '/photos'
      click_link 'Upload a photo'
      fill_in 'Title', with: 'Best Burger'
      click_button 'Upload photo'
      expect(page).to have_content 'Best Burger'
    end

    scenario 'Adding Image' do
      visit '/photos'
      click_link 'Upload a photo'
      fill_in 'Title', with: 'Best Burger'
      attach_file 'photo[image]', 'spec/features/bestburger.png'
      click_button 'Upload photo'
      expect(page).to have_content 'Best Burger'
      expect(page).to have_css ('img[src*="bestburger.png"]')
    end
  end
end
