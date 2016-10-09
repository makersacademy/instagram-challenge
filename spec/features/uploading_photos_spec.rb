require 'rails_helper'


feature 'Upload pictures' do
  context 'Welcome Page' do
    scenario 'Welcome is displayed when loading the page' do
      visit '/photos'
      expect(page).to have_content("Add your photos and share you experiences!")
    end
  end

  context 'Uploading a photo' do
    scenario 'when a picture is uploaded' do
      visit ('/photos/new')

    end
  end
end
