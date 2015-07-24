require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

    scenario 'adding a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in('Caption', with: 'Test caption')
      attach_file 'Image', '/users/kirstenjones/projects/instagram-challenge/spec/capybara.jpeg'
      click_button 'Create Picture'
      expect(page).to have_content 'Test caption'
      expect(page).not_to have_content 'No pictures yet'
    end
end
