require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should show an upload button' do
      visit '/photos'
      expect(page).to have_content 'no photos!'
      expect(page).to have_button 'Upload your photo'
    end
  end
end