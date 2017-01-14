require 'rails_helper'

feature 'contributions' do
  context 'no contributions have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/contributions'
      expect(page).to have_content 'No contributions yet'
      expect(page).to have_link 'Add a contribution'
    end
  end
end
