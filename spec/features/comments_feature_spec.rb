require 'rails_helper'

feature 'comments' do

  before do
    user_sign_up
    create_post
    click_link 'Sign out'
  end
  
  context 'add comment' do
    scenario 'allow users to leave a comment using a form' do
      user_sign_in
      leave_comment
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Super cute!'
    end

    it "user should be logged in to be able to add a comment" do
      visit '/'
      click_link 'Add a comment'
      expect(current_path).to eq '/users/sign_in'
    end

  end

  context 'delete comment' do

    scenario 'when a restaurant is deleted, their comments should too' do
      user_sign_in
      leave_comment
      visit '/posts'
      click_link 'Picture'
      click_link 'Delete'
      expect(page).not_to have_content 'Super cute!'
      expect(page).to have_content 'Post deleted successfully'
    end

    it "user should be logged in to be able to delete a comment" do
      user_sign_in
      leave_comment
      click_link 'Sign out'
      click_link 'Delete'
      expect(page).to have_content 'You cannot delete a comment without being logged in'
    end

    it 'user should be able to delete their own comment' do
      user_sign_in
      leave_comment
      visit '/posts'
      click_link 'Delete'
      expect(page).to have_content('Comment deleted successfully')
    end

    it 'user should not be able to delete a comment that was created by someone else' do
      user_sign_in
      leave_comment
      click_link 'Sign out'
      user_two_sign_up
      visit '/posts'
      click_link 'Delete'
      expect(page).to have_content('Error: You must be the author to delete a comment')
    end

  end

end