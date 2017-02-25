require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'restaurants have been added' do
    before do
      Image.create()
    end

    scenario 'display images' do
      visit '/images'
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'creating images' do
    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/'
      click_link 'Add an image'
      # fill_in 'Name', with: 'KFC'
      click_button 'Create Image'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting restaurants' do

    before { Image.create() }

    scenario 'removes an image when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete'
      expect(page).to have_content 'Image deleted successfully'
    end

  end
end
