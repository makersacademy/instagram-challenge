require 'rails_helper'

feature 'scenes' do
  context 'no scenes should have been added' do
    scenario 'should display a prompt to add a scene' do
      visit '/scenes'
      expect(page).to have_content 'No scenes yet'
      expect(page).to have_link 'Add a scene'
    end
  end
end
