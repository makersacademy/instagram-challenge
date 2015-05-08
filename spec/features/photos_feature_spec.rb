require 'rails_helper'

feature 'As a user on the homepage' do

  context 'when there are no photos to show' do

    scenario 'I am presented with a photo upload form' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_button 'Upload photo'
    end

  end

  context 'when photos have been uploaded' do

    before do
      Photo.create(caption: 'dog')
    end

    scenario 'I can see the photos on the page' do
      visit '/photos'
      expect(page).to have_content('dog')
      expect(page).not_to have_content('No photos yet')
    end

  end

end