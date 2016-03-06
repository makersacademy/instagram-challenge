require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    it 'prompts a user to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures to display'
      expect(page).to have_link 'Add picture'
    end
  end
end
