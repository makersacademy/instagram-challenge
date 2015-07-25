require 'rails_helper'

feature 'pictures' do
  context 'No pictures added' do
    scenario 'Display prompt to add picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet')
      expect(page).to have_content('Add a picture')
    end
  end

  context 'Pictures added' do
    before do
      Picture.create()
    end

    scenario 'Displays pictures' do

    end
  end
end