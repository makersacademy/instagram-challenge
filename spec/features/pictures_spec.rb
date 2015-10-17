require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
    visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do 
      Picture.create(name: 'Mountain')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Mountain')
      expect(page).not_to have_content('No pictures yet')
    end
  end

end
