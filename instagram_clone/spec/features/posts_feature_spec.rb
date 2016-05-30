require 'rails_helper'

feature 'posts' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a  photo' do
      visit '/posts'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end
end
