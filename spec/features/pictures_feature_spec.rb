require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'You have no pictures yet.'
      expect(page).to have_link 'Add a picture'
    end
  end


end
