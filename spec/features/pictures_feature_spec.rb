require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'displays a link to add a new picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet!')
      expect(page).to have_content('Add a new picture')
    end
  end
end