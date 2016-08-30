require 'rails_helper'

feature 'comments' do

  before do
    sign_up
    create_post
  end

  scenario 'allows users to leave a comment using a form' do
     create_comment('cute')
     click_link 'View Comments'
     id = Post.first.id
     expect(current_path).to eq "/posts/#{id}"
     expect(page).to have_content('cute')
  end

  context 'an invalid comment' do
    it 'does not let you submit a comment that is too long' do
      comment = 'This is a way, way, way too long of a comment, and so the validation should make this an invalid comment and raise an error to notifying the user to shorten their message to a maximum of 200 characters.'
      create_comment comment
      expect(page).to have_content 'Content is too long'
    end
  end

  context 'signed out' do
    it 'users cannot comment unless signed in' do
      click_link 'Sign out'
      expect(page).not_to have_link 'Comment'
    end
  end

  context 'editing reviews' do

    before do
      create_comment("soooooooo cute")
    end

    scenario 'let a user edit a comment' do
      click_link 'View Comments'
      click_link 'Edit Comment'
      fill_in 'Content', with: 'so cute'
      click_button 'Update Comment'
      click_link 'View Comments'
      expect(page).to have_content 'so cute'
      expect(page).not_to have_content 'soooooooo cute'
    end
  end

  context 'deleting reviews' do

    before do
      create_comment("hello")
    end

    scenario 'lets a user delete a review they created' do
      click_link 'View Comments'
      click_link 'Delete Comment'
      expect(page).to have_content 'Comment deleted successfully'
    end

    scenario 'will not let a user delete a comment they did not create' do
      click_link 'Sign out'
      sign_up(email: 'test@example.com')
      click_link 'View Comments'
      expect(page).not_to have_link 'Delete comment'
    end
  end


end
