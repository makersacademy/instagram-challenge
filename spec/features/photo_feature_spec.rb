require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a propmt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos added!'
      expect(page). to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'sunset.jpg')
  end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('sunset.jpg')
      expect(page).not_to have_content('No photos added')
    end
  end
end
