require 'rails_helper'

feature 'photos' do

  context 'no photo have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photo have been added' do
    before {Photo.create title: 'Awesome see'}
    scenario 'should display a photo' do
      visit 'photos'
      expect(page).to have_content 'Awesome see'
    end
  end

end