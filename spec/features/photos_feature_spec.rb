require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display message "no photos on your feed"' do
      visit photos_path
      expect(page).to have_content 'no photos on your feed'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(caption: 'Cat')
    end

    scenario 'display photos' do
      visit photos_path
      expect(page).to have_content 'Cat'
      expect(page).not_to have_content 'no photos on your feed'
    end
  end

end