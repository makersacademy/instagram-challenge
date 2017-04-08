require 'rails_helper'

feature 'likes' do

  before do
    sign_up
  end

  before { Photo.create caption: 'BBQ' }

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

end
