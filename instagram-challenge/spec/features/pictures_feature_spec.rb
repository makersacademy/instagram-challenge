require 'rails_helper'

feature 'Pictures' do
  context 'no pictures have been added' do
    scenario 'should ask user to log in to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures added yet"
      expect(page).to have_content "Add a picture"
    end
  end
end