require 'rails_helper'

feature 'comments' do

  context 'User own comments' do
    before(:each) do
      sign_up
      post_image
    end

    scenario 'can comment from posts page' do
      fill_in 'comment_content', with: 'Great work!'
      click_button 'Create Comment'
      expect(page).to have_content 'Great work!'
      expect(page).to have_content 'You have successfully commented!'
    end

    scenario 'can comment from individual post page' do
      visit "/posts/#{Post.first.id}"
      fill_in 'comment_content', with: 'Great work!'
      click_button 'Create Comment'
      expect(page).to have_content 'Great work!'
      expect(page).to have_content 'You have successfully commented!'
    end

    scenario 'can delete comment' do
      visit "/posts/#{Post.first.id}"
      fill_in 'comment_content', with: 'Great work!'
      click_button 'Create Comment'
      click_link 'span.delete-comment'
      expect(page).to have_content 'Comment deleted successfully!'
    end

  end
end