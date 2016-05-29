require 'rails_helper'

feature 'Likes' do

  let!(:user) { User.create(email: 'sity@pop.com', password: 'secret') }
  let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

  context 'User is signed in' do

    it 'a photo\'s likes count increases when a user clicks like' do
      sign_in_as(user)
      visit pictures_path
      expect(page).to have_content '0 ♥'
      click_link 'Like'
      expect(page).to have_content '1 ♥'
    end

    it 'can only like a photo once' do
      sign_in_as(user)
      visit pictures_path
      click_link 'Like'
      expect(page).to have_content '1 ♥'
      expect(page).not_to have_link 'Like'
    end
  end

  context 'User is not signed in' do

    it 'unable to like a photo' do
      visit pictures_path
      expect(page).not_to have_link 'Like'
    end
  end

end
