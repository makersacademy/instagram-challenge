require 'rails_helper'

feature 'Feature Pictures' do
  context 'no pictures have been added' do
    scenario 'unsigned-in user visits the main url for the site' do
      visit '/pictures'
      #expect(page).to have_content 'Instagram'
      expect(page).to have_content 'No pictures yet'
    end
  end
end
