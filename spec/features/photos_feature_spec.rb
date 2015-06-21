require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should show an upload button' do
      visit '/photos'
      expect(page).to have_content 'no photos!'
      expect(page).to have_button 'Upload your photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(caption: "what a picture - what a photograph!")
    end

    scenario 'should display caption' do
      visit '/photos'
      expect(page).to have_content('what a picture - what a photograph!')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
end