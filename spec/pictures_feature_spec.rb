require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).not_to have_content 'Like'
      expect(page).to have_link 'New post'
    end
  end
end