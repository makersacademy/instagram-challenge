require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/photos'
      expect(page).to have_content 'No photos uploaded yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'add photos' do
    before do
      Photo.create(description: 'The Beach')
    end

    scenario 'should display the photo description' do
      visit '/photos'
      expect(page).to have_content 'The Beach'
    end
  end

  context 'creating photos' do
    scenario 'asks user to describe the photo being uploaded' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Description', with: 'The Beach'
      click_button 'Create Photo'
      expect(page).to have_content 'The Beach'
      expect(current_path).to eq '/photos'
    end
  end
end
