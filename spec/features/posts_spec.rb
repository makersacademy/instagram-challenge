require 'rails_helper'

feature 'Posts' do
  context 'creating posts' do
    scenario 'user fills in a form, then displays the new post' do
      visit('/')
      click_link 'New post'
      attach_file('Image', "spec/files/images/first.jpg")
      fill_in 'Caption', with: 'Lorem ipsum dolor sit amet.'
      click_button 'Create Post'
      expect(page).to have_content('Lorem ipsum dolor sit amet.')
      expect(page).to have_css("img[src*='first.jpg']")
    end
    scenario 'not saving new post without image' do
      visit('/')
      click_link 'New post'
      fill_in 'Caption', with: 'Lorem ipsum dolor sit amet.'
      click_button 'Create Post'
      expect(page).not_to have_content('Lorem ipsum dolor sit amet.')
      expect(page).to have_content 'error'
    end
  end
end
