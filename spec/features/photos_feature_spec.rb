require 'rails_helper'

feature 'photo' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'Be the first to add a photo'
      expect(page).to have_button 'Post a photo'
    end
  end
end
