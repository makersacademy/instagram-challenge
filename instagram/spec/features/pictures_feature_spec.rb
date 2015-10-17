require 'rails_helper'


feature 'pictures' do
  context 'no pictures should be added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures yet"
      expect(page).to have_link "Upload a picture"
    end
  end
end
