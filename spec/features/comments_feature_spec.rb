require 'rails_helper'

feature 'comments' do

  before do
    sign_up
    create_post
  end

  scenario 'allows users to leave a comment using a form' do
     create_comment('cute')
     expect(current_path).to eq '/posts'
     expect(page).to have_content('cute')
  end

  context 'an invalid comment' do
    it 'does not let you submit a comment that is too long' do
      comment = 'This is a way, way, way too long of a comment, and so the validation should make this an invalid comment and raise an error to notifying the user to shorten their message to a maximum of 200 characters.'
      create_comment comment
      expect(page).not_to have_content comment
      expect(page).to have_content 'error'
    end
  end

  context 'signed out' do
    it 'users cannot comment unless signed in' do
      click_link 'Sign out'
      expect(page).not_to have_link 'Comment on dog'
    end
  end

end
