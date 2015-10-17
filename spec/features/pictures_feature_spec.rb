require 'rails_helper'

feature 'Pictures' do

  context 'when there are no pictures' do

    scenario 'should have a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

    scenario 'should be able to add a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'Kiss'
      click_button 'Create Picture'
      expect(page).to have_content 'Kiss'
      expect(page).not_to have_content 'No pictures yet'
    end

  end

  context 'pictures have been created' do

    let!(:picture) { Picture.create(name: 'Love', description: 'I love you') }

    scenario 'should display the pictures' do
      visit '/pictures'
      expect(page).to have_content 'Name: Love'
      expect(page).to have_content 'Description: I love you'    
    end

    scenario 'can go to the pictures individual page' do

    end

  end

end
