require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new pictures' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Description', with: 'tower bridge'
      click_button 'Create Picture'
      expect(page).to have_content 'tower bridge'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'pictures have been added' do

    before do
      Picture.create(description: 'tower bridge')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('tower bridge')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'let a user edit a picture' do
      visit '/pictures'
      click_link 'Edit'
      fill_in 'Description', with: 'london bridge'
      click_button 'Update Picture'
      expect(page).to have_content 'london bridge'
      expect(current_path).to eq '/pictures'
    end

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete'
      expect(page).not_to have_content 'tower bridge'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
