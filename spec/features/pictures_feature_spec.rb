require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding a picture' do
    scenario 'adding and viewing a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/pictures/new'
      attach_file "picture_image", "spec/pictures/test_picture.jpg"
      click_button "submit"
      expect(page).to have_css("img[src*='test_picture.jpg']")
    end
  end
end
