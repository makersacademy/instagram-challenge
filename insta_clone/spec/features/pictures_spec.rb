require 'rails_helper'
feature 'pictures' do
  context 'no pictures have been posted yet' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end
  context 'picture has been posted' do
    scenario 'picture is posted' do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Caption', with: '#blessed'
      fill_in 'Location', with: 'London'
      page.attach_file('picture_image', './public/insta.jpg')
      click_button 'Create Picture'
      expect(page).to have_content '#blessed'
      expect(page).to_not have_content 'No pictures yet'
      expect(page).to have_css("img[src*='insta.jpg']")
    end
  end
end
