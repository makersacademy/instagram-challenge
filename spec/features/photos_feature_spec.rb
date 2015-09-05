require 'rails_helper'

feature 'photos' do
  context 'no photos added' do
    scenario 'should display a Upload Photo button' do
      visit photos_path
      expect(page).to have_link 'Upload Photo'
      expect(page).to have_content 'No photos yet!'
    end

  end
end
