require 'rails_helper'

feature 'photos' do
  context 'no photos are uploaded' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Upload photo'
    end
  end
end
