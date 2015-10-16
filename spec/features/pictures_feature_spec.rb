require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: 'Nice')
    end

    scenario 'display picture descriptions' do
      visit '/pictures'
      expect(page).to have_content('Nice')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating descriptions' do
    scenario 'users can add a description' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Description', with: 'Nice'
      click_button 'Post'
      expect(page).to have_content 'Nice'
    end
  end

end
