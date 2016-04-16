require 'rails_helper'

feature 'pictures' do
  scenario 'no pictures have been added' do
    visit '/pictures'
    expect(page).to have_content 'No pictures yet!'
    expect(page).to have_link 'Add picture'
  end

  context 'adding pictures' do
    scenario 'adds new picture, displays description' do
      visit '/pictures'
      click_link 'Add picture'
      attach_file 'picture[image]', 'app/assets/images/DOGE.jpeg'
      fill_in 'Description', with: '#sun #spring'
      click_button 'Add'
      expect(page).to have_css("img[src*='DOGE']")
      expect(page).to have_content '#sun #spring'
      expect(page).not_to have_content 'No pictures yet!'
    end
  end
end
