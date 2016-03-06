require 'rails_helper'

feature 'Photos' do
  context 'No photos have been added' do
    scenario 'Displays a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'Photos have been added' do
    before do
      Photo.create(file: 'test.jpg')
    end

    scenario 'Display photos' do
      visit '/photos'
      expect(page).to have_content('test.jpg')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'Adding photos' do
    scenario 'Prompts users to fill out a form with the filename and attach an image for upload' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'File', with: 'Test'
      attach_file('Image', '/Users/jeremybarrass/Pictures/Space!/AI_dream2.jpg')
      click_button 'Create Photo'
      expect(page).to have_content 'Test'
      expect(page).to have_content :thumb
    end
  end
end
