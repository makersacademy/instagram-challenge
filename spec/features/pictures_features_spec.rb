require 'rails_helper'

feature 'pictures' do
  context 'no pictures to begin' do
    scenario 'should display a prompt to add pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end
  end
end