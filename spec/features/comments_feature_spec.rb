require 'rails_helper'
require_relative '../helpers/session_helpers.rb'

include Session

feature 'Adding comments' do
  before {Photo.create descr: 'Mount Fuji'}

  context 'Signed in' do
    before {sign_up('test@example.com', 'password')}

    scenario 'Allows users to leave a comment (if signed in)' do
      click_link 'Comment on Mount Fuji'
      fill_in 'Comment:', with: 'So pretty!'
      click_button 'Leave comment'
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'So pretty!'
    end

    scenario 'Does not let you submit a blank comment' do
      leave_comment('')
      expect(page).not_to have_css 'h3'
      expect(page).to have_content 'Comment cannot be left blank'
    end
  end

  context 'Not signed in' do
    scenario 'Does not allow users to leave a comment' do
      visit '/photos'
      click_link 'Comment on Mount Fuji'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
      expect(page).not_to have_content 'Comment:'
    end
  end
end