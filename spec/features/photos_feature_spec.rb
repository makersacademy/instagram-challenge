require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do

    scenario 'should display no photos added yet' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end
  end

    scenario 'should display a link to add photos' do
      visit '/'
      expect(page).to have_link 'Add a photo'
    end

  context 'creating restaurants' do

    scenario 'should take you to a page where you can upload a photo' do
      visit '/'
      click_link 'Add a photo'
      expect(current_path).to eq '/photos/new'
    end
  end

end
