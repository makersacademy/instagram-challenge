require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been posted' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been posted' do
    before do
    Picture.create(:picture, user: create(:user, username: 'user'))
    end
    scenario 'display picture' do
      visit '/pictures'
      expect(page).to have_css("img[src*='image_name.png']")
    end
  end
end
