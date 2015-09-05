require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/photos'
      expect(page).to have_content 'no photos yet'
      expect(page).to have_link 'Add Photo'
    end
  end
end