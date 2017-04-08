require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been uploaded' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture location has been added' do
    before do
      p Picture.create(location: 'London')
    end

    scenario 'display picture location' do
      visit '/pictures'
      expect(page).to have_content('London')
      expect(page).to_not have_content('No pictures yet')
    end
  end
end
