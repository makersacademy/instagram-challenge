require 'rails_helper'

feature 'Photos' do

  context 'No photos added' do

    scenario 'displays a prompt to add a photo' do
      visit '/'
      expect(page).to have_link 'Add a photo'
      expect(page).to have_content 'Oh no, it seems there are no photos to display'
    end

  end

end
