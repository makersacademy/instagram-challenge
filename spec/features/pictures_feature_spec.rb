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
      Picture.create(caption: 'Another selfie!')
    end

    it 'should display the added picture' do
      visit '/pictures'
      expect(page).to have_content 'Another selfie!'
      expect(page).not_to have_content 'No pictures yet'
    end
  end

end
