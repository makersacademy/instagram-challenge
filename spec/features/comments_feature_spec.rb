require 'rails_helper'

feature 'comments' do
  before { Post.create title: 'dog' }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on dog'
     fill_in "Content", with: "cute"
     click_button 'Post Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('cute')
  end

  context 'an invalid comment' do
    it 'does not let you submit a comment that is too long' do
      comment = 'This is a way, way, way too long of a comment, and so the validation should make this an invalid comment and raise an error to notifying the user to shorten their message to a maximum of 200 characters.'
      visit '/posts'
      click_link 'Comment on dog'
      fill_in 'Content', with: comment
      click_button 'Post Comment'
      expect(page).not_to have_content comment
      expect(page).to have_content 'error'
    end
  end

end
