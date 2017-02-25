require 'rails_helper'

feature 'Home' do
  context 'Visit homepage' do
    scenario 'It should display a link to add picture' do
      visit '/'
      expect(page).to have_content "No image added yet"
      expect(page).to have_link "Add picture"
    end
  end
end
