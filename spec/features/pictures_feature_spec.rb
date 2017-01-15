require 'rails_helper'

feature 'restaurants' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'no pictures yet'
      expect(page).to have_link 'add a picture'
    end
  end

  context 'pictures have been added' do
    scenario 'display pictures' do
      sign_up
      create_picture
      visit '/pictures'
      expect(page).to have_content('This is my cat')
      expect(page).not_to have_content('no pictures yet')
    end
  end

  context 'posting pictures' do
    scenario 'user uploads images and writes caption, then the post is displayed' do
      sign_up
      create_picture
      page.has_image?(src: './public/cat.png', alt: 'picture')
      expect(page).to have_content('This is my cat')
    end

    scenario 'username is displayed with each picture' do
      sign_up
      create_picture
      expect(page).to have_content('amanda')
    end
  end

  # context 'viewing posts' do
  #   let!(:cat_pic){ Picture.create(image: './public/cat.png', caption: 'This is my cat') }
  #     scenario 'lets a user view a post in full' do
  #       visit '/pictures'
  #       click_link 'picture'
  #       expect(page).to have_content 'This is my cat'
  #       expect(current_path).to eq '/pictures/#{cat_pic.id}'
  #     end
  # end

  context 'editing posts' do
    scenario 'let a user edit a post' do
      sign_up
      create_picture
      visit '/pictures'
      click_link '1'
      click_link 'edit'
      fill_in 'picture_caption', with: 'Cute cat'
      click_button 'done'
      expect(page).to have_content('Cute cat')
      expect(page).not_to have_content('This is my cat')
    end
  end

  context 'deleting pictures' do
    scenario 'removes a picture when a user clicks a delete link' do
      sign_up
      create_picture
      visit '/pictures'
      click_link '1'
      click_link 'delete'
      expect(page).not_to have_content 'This is my cat'
      expect(page).to have_content 'this post has been deleted'
    end
  end

  context 'an invalid picture' do
    scenario 'user tries to create post without uploading an image' do
      sign_up
      visit '/pictures'
      click_link 'add a picture'
      fill_in 'picture_caption', with: 'This is my cat'
      click_button 'share'
      expect(page).to have_content('you must select a picture!')
    end
  end
end
