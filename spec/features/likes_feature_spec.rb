require 'rails_helper'

feature 'liking' do

  context 'when not logged in' do

    before do
      Picture.create(name:'another test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')
    end
    scenario 'a visitor cannot like a picture' do
      visit '/pictures'
      click_link 'like'
      expect(page).to have_content 'Log in'
    end
  end

  context 'when logged in' do

    before do
      sign_up
      new_picture
      like_picture
    end

    scenario 'a visitor can like a picture' do
      expect(current_path).to eq '/pictures'
      expect(page).to have_content('Likes: 1')
    end

    scenario 'a visitor can only like a picture once' do
      like_picture
      expect(page).to have_content('You have already liked this picture')
    end

    def sign_up
      visit '/pictures'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@makers.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
    end

    def new_picture
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Avatar', 'spec/features/test.jpg'
      fill_in 'Name', with: 'test'
      click_button 'Create Picture'
    end

    def like_picture
      visit '/pictures'
      click_link 'like'
    end
  end
end
