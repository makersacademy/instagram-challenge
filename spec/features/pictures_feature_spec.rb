require 'rails_helper'

feature '<<Pictures>>' do
  context 'when no pictures have been added' do
    scenario 'it should show prompt to upload an image' do
      visit '/pictures'
      expect(page).to have_content 'There aren\'t any pictures here yet.'
      expect(page).to have_link 'Upload a picture...'
      end
  end

  context 'when pictures have been added' do
    before do
      Picture.create(name: 'Pirate Party!')
    end

    scenario 'it should display the pictures' do
      visit '/pictures'
      expect(page).to have_content 'Pirate Party!'
      expect(page).not_to have_content 'There are\'nt any pictures here yet.'

    end

  end
end
