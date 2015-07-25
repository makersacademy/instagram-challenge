require 'rails_helper'

feature 'photos' do
  context 'no photos have been uploaded' do
    scenario 'displays a link to add photos' do
      visit '/'
      expect(page).to have_content 'No photos have been uploaded!'
      expect(page).to have_link 'Upload Photo'
    end

  end


end
