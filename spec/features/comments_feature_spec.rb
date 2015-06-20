require 'rails_helper'

feature 'Adding comments' do
  before {Photo.create descr: 'Mount Fuji'}

  scenario 'Allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Comment on Mount Fuji'
     fill_in 'Comment:', with: 'So pretty!'
     click_button 'Leave comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('So pretty!')
  end

  context 'An invalid comment' do
    it 'Does not let you submit a comment that is too short' do
      visit '/photos'
      click_link 'Comment on Mount Fuji'
      fill_in 'Comment:', with: ''
      click_button 'Leave comment'
      expect(page).not_to have_css 'h3'
      expect(page).to have_content 'Comment cannot be left blank'
    end
  end

end