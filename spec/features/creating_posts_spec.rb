require 'rails_helper'

feature 'Creating posts' do
  context 'adding a post' do
    scenario 'you should see that post' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', "app/assets/images/coffee.jpg"
      fill_in 'Caption', with: 'COFFEE'
      click_button 'Create Post'
      expect(page).to have_content 'COFFEE'
      expect(page).to have_css "img[src*='coffee.jpg']"
    end
  end

  context 'needs an image to create a post' do
    scenario 'Throws an error if you try create a post without an image' do
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: 'rebel'
      click_button 'Create Post'
      expect(page).to have_content 'Where yo image at'
    end
  end
end
