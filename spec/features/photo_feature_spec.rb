require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a propmt to add a photo' do
      visit '/'
      expect(page).to have_content 'No photos added'
      expect(page). to have_link 'Add a photo'
    end
  end
end