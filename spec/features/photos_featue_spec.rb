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
    scenario 'should display photo' do
      visit '/photos'
      click_button 'Upload your photo'
      fill_in form with "what a picture - what a photograph!"
      # upload picture??
      expect(page).to have_content "what a picture - what a photograph!"
    end
end