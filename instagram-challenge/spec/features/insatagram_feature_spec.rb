require 'rails_helper'

feature 'instagram' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add some pictures' do
      visit '/instagram'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end
end
