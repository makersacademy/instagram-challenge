require 'rails_helper'

feature '_form' do

  context 'When a user naviagtes to the new page' do
    scenario 'Page should have Title field' do
      visit('/photos/new')
      expect(page).to have_field('Title')
    end

    scenario 'Page should have Description field' do
      visit('/photos/new')
      expect(page).to have_field('Description')
    end

    scenario 'Page should have Create Photo button' do
      visit('/photos/new')
      expect(page).to have_button('Create Photo')
    end
  end

  context 'When a user inputs a correct title and description' do
    scenario 'Should redirect page once user submits form' do
      create_a_photo
      expect(current_path).not_to eq('/photos/new')
    end
  end
end
