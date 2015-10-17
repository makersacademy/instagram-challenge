require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do

    scenario 'should display no photos added yet' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end

    scenario 'should display a link to add photos' do
      visit '/'
      expect(page).to have_link 'Add a photo'
    end
  end
end
