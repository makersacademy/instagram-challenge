require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'creating a picture with descriptions' do
    scenario 'users can add a picture with descriptions' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('Picture', './spec/fixtures/associations.jpg')
      fill_in 'Description', with: 'Nice'
      click_button 'Post'
      expect(current_path).to eq '/pictures'
      expect(page).to have_selector 'img'
      expect(page).to have_content 'associations'
      expect(page).to have_content 'Nice'
    end
  end

  context 'editing descriptions' do
    scenario 'user can edit descriptions' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('Picture', './spec/fixtures/associations.jpg')
      fill_in 'Description', with: 'Nice'
      click_button 'Post'
      click_link 'Edit'
      fill_in 'Description', with: 'Great'
      click_button 'Post'
      expect(page).not_to have_content 'Nice'
      expect(page).to have_content 'Great'
    end
  end


end
