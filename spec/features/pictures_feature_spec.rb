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

    scenario 'prompts user to upload a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'little wren'
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      expect(page).to have_content 'little wren'
      expect(page).to have_xpath("/html/body/p[1]/a/img")
    end

    scenario 'user can post image without title' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      expect(page).to have_xpath("/html/body/p[1]/a/img")
    end

    scenario 'user has to upload picture' do
      visit '/pictures'
      click_link 'Add a picture'
      click_button 'Post'
      expect(page).to have_content "Image can't be blank"
    end
  end

  context 'viewing pictures' do
    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'little wren'
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      click_link 'little wren'
      expect(current_path).to eq "/pictures/#{Picture.first.id}"
    end
  end

  context 'deleting pictures' do

    scenario 'let a user delete a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
      click_button 'Post'
      click_link 'Delete'
      expect(page).not_to have_content 'little wren'
      expect(page).to have_content 'Picture deleted successfully'
    end


  end

end
