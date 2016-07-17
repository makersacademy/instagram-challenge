require 'rails_helper'

feature 'Creating posts' do
  context 'adding a post' do
    scenario 'you should see that post' do
      sign_up
      click_link 'New Post'
      attach_file 'Image', "app/assets/images/coffee.jpg"
      fill_in 'Caption', with: 'COFFEE'
      click_button 'Create Post'
      expect(page).to have_content 'COFFEE'
      expect(page).to have_css "img[src*='coffee.jpg']"
    end

   scenario 'needs an image to post' do
      sign_in
      click_link 'New Post'
      fill_in 'Caption', with: 'rebel'
      click_button 'Create Post'
      expect(page).to have_content 'Where yo image at'
    end

  end
end
