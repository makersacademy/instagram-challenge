require 'rails_helper'

feature 'contributions' do
  context 'no contributions have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/contributions'
      expect(page).to have_content 'No contributions yet'
      expect(page).to have_link 'Add a contribution'
    end
  end

  context 'contributions have been added' do
    before do
      Contribution.create(comment: 'A black cat')
      # image: '/Users/asukaochi/Downloads/IMG_20161220_101030.jpg',
    end

    scenario 'display contributions' do
      visit '/contributions'
      expect(page).to have_content 'A black cat'
      expect(page).not_to have_content('No contributions yet')
    end
  end
end
