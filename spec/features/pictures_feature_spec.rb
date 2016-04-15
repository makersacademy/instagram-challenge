require 'rails_helper'

feature 'pictures' do
  scenario 'no pictures have been added' do
    visit '/pictures'
    expect(page).to have_content 'No pictures yet!'
    expect(page).to have_link 'Add picture'
  end

  context 'adding pictures' do
    scenario 'adds new picture, displays picture' do
      visit '/pictures'
      click_link 'Add picture'
      fill_in 'Description', with: '#sun #spring'
      click_button 'Add'
      expect(page).to have_content '#sun #spring'
      expect(page).not_to have_content 'No pictures yet!'
    end
  end

  pending context 'have been added' do
    before do
      Picture.create(description: '#sun #spring')
    end

    scenario 'displays pictures' do
      visit '/pictures'
      expect(page).to have_content '#sun #spring'
      expect(page).not_to have_content 'No pictures yet!'
    end
  end
end
