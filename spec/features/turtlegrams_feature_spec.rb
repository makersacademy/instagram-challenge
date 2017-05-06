require 'rails_helper'

feature 'turtlegrams' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a turtlegram' do
      visit '/turtlegrams'
      expect(page).to have_content 'No turtlegrams yet'
      expect(page).to have_content 'Add a turtlegram'
    end
  end
end
