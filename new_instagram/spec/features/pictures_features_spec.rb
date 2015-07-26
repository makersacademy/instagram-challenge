require 'rails_helper'

feature 'pictures' do
  context 'no pictures added' do
    scenario 'should display a promp to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end
end