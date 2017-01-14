require 'rails_helper'

feature 'restaurants' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture_image', File.absolute_path('./public/cat.png'))
      fill_in 'picture_caption', with: 'This is my cat'
      click_button 'Create Picture'
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('This is my cat')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'posting pictures' do
    scenario 'user uploads images and writes caption, then the post is displayed' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture_image', File.absolute_path('./public/cat.png'))
      fill_in 'picture_caption', with: 'This is my cat'
      click_button 'Create Picture'
      page.has_image?(src: './public/cat.png', alt: 'picture')
      expect(page).to have_content('This is my cat')
    end
  end
end
