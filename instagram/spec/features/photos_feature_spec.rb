require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to post a photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end


  context 'Photos have been added' do
    
    before {Photo.create description: 'Fujisan'}
    
    scenario 'Display photos' do
      visit '/photos'
      expect(page).to have_content 'Fujisan'
      expect(page).not_to have_content 'No photos yet'
    end
  end

end