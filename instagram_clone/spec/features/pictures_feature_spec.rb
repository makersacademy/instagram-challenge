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
      Picture.create(url: 'fakepic')
    end

    scenario 'Displays pictures' do
      visit '/pictures'
      expect(page).to have_content('fakepic')
      expect(page).not_to have_content('No pictures yet')
    end
  end
end