require 'rails_helper'

feature 'Photos' do
  context 'with no uploaded photos' do
    it 'A user can view the homepage' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end

    it 'A user is prompted to upload a photo' do
      visit '/'
      click_link 'Upload photo'
      expect(page).to have_content 'Upload photo here'
    end
  end
end
