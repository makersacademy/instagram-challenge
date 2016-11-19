require 'rails_helper'

feature 'Pictures:' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "You don't have any pictures yet"
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'so a user can start sharing' do
    scenario 'should display pictures' do
      visit '/pictures'
      click_link('Upload a picture')
      expect(page).to have_css("img[src*='file_name_here']")
    end
  end
end
