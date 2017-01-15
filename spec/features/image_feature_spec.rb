require 'rails_helper'

feature 'photos' do
  context 'No images have been added' do
    scenario 'Should display a prompt to add an image' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'After a photo is added the user should see the photo' do

    before do
      Photo.create(name: 'Beach holiday')
    end

    scenario 'Add a photo and the title should appear on the page' do
      visit '/photos'
      expect(page).to have_content('Beach holiday')
      expect(page).not_to have_content('No photos uploaded yet')
    end
  end
end
