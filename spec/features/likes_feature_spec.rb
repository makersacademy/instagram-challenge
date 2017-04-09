require 'rails_helper'

feature 'likes' do

  before do
    sign_up
    add_photo
  end

  scenario 'like button is available on index page' do
     visit '/photos'
     expect(page).to have_button('Like')
  end

  scenario 'allows users to like the photo by clicking the like button' do
     visit '/photos'
     click_button 'Like'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Likes: 1')
  end

  scenario 'clicking like button twice will unlike the photo' do
     visit '/photos'
     click_button 'Like'
     expect(page).to have_content('Likes: 1')
     expect(page).not_to have_button('Like')
  end

end
