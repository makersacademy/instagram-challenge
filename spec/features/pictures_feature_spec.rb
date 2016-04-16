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
      # p current_path
      # click_button 'Choose File'
      # attach_file 'image' , 'app/assets/images/DOGE.jpeg'
      # pix = Picture.create(:image 'app/assets/images/DOGE.jpeg', description:'#sun #spring')
      fill_in 'Description', with: '#sun #spring'
      click_button 'Add'
      # expect(page).to have_css("img[src*='Doge']")
      expect(page).to have_content '#sun #spring'
      expect(page).not_to have_content 'No pictures yet!'
    end
  end
end
