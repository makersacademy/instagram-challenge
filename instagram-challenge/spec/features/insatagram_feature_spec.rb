require 'rails_helper'

feature 'instagram' do
  context 'no pictures have been added' do
    scenario 'should display a notice saying no picutres added yet' do
      visit '/instagram'
      expect(page).to have_content 'No pictures yet'
    end
  end
end
