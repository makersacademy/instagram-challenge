require 'rails_helper'

feature 'feed' do

  context 'no pictures should have been added' do

    scenario 'use should recieve a prompt to add a picture' do
      visit '/feed'
      expect(page).to have_content('Nothing seems to have been added yet.')
      expect(page).to have_link('Add photo')
    end
  end
end
