require 'rails_helper'

feature 'index' do
  context 'When a user visits the index page' do
    before do
      create_a_photo
      visit('/')
    end
    scenario 'A user should be able to view photos' do
      expect(page).to have_content('testphoto')
    end

    scenario 'A user should be able to click pin titles to see the show pin page' do
      click_link('testphoto')
      expect(page).to have_content('describedtest')
    end

    scenario 'A user should be able to click a link to create a new pin' do
      visit('/')
      expect(page).to have_link('New Photo')
    end
  end
end
