require 'rails_helper'

feature 'feed' do
  context 'pictures' do
    context 'no pictures have been added' do
      scenario 'should display a prompt to add a picture' do
        visit '/feed'
        expect(page).to have_content 'No Pictures Yet!'
        expect(page).to have_link 'Add a Picture'
      end
    end

    context 'restaurants have been added' do
      before do
        Restaurant.create(name: 'KFC')
      end

      scenario 'display restaurants' do
        visit '/restaurants'
        expect(page).to have_content('KFC')
        expect(page).not_to have_content('No restaurants yet')
      end
    end
  end
end
