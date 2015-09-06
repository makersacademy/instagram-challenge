require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture caption have been added' do
    before do
      Picture.create(caption: 'holiday snap')
    end

    scenario 'display captions' do
      visit '/pictures'
      expect(page).to have_content('holiday snap')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating picture captions' do
    scenario 'prompts user to fill out a form, then displays the new picture caption' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Caption', with: 'holiday snap'
      click_button 'Create Picture'
      expect(page).to have_content 'holiday snap'
      expect(current_path).to eq '/pictures'
    end
  end
end
