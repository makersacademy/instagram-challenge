require 'rails_helper'

feature 'photographs' do
  context 'no photographs have been added' do
    scenario 'should display a prompt to add a photograph' do
      visit '/photographs'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'photographs have been added' do
    before do
      Photograph.create(description: 'description')
    end

    scenario 'displays photographs' do
      visit '/photographs'
      expect(page).to have_content('description')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating a photograph' do
    scenario 'prompts the user to fill out a form, then displays the new restaurant' do
      visit '/photographs'
      click_link 'Add a post'
      fill_in 'Description', with: 'description'
      click_button 'Create Photograph'
      expect(page).to have_content('description')
      expect(current_path).to eq '/photographs'
    end
  end
end
