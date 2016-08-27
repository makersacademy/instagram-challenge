require 'rails_helper'

feature 'Pictures' do
  context 'no pictures have been added' do
    scenario 'user not signed in visits the main url for the site' do
      visit '/pictures'
      #expect(page).to have_content 'Instagram'
      expect(page).to have_content 'No pictures yet'
    end
  end
end
