require 'rails_helper'

feature 'Commenting' do
  before {Photo.create descr: 'Mount Fuji'}

  scenario 'Allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Comment on Mount Fuji'
     fill_in 'Comment:', with: 'So pretty!'
     click_button 'Leave comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('So pretty!')
  end

end