require 'rails_helper'

feature 'post pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures to post' do
    before do
      Picture.create(title: 'little wren')
    end
    scenario 'user can make a post on the page' do
      visit '/pictures'
      expect(page).to have_content('little wren')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'prompts user to upload a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'little wren'
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      expect(page).to have_content 'little wren'
      expect(page).to have_xpath("/html/body/img[1]")
    end

    scenario 'user can post image without title' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: ''
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      expect(page).to have_xpath("/html/body/img[1]")
    end
  end
end
