require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'restaurants have been added' do
    before { Post.create(description: 'Test post') }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Test post')
      expect(page).not_to have_content('No posts yet')
    end
end

  context 'new post' do
    scenario 'user can add a post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'First Post'
      click_button 'Create Post'
      expect(page).to have_content 'First Post'
      expect(page).not_to have_content 'No posts yet'
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing restaurants' do
    before { Post.create description: 'Hello' }

    scenario 'let a user edit a description' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Description', with: 'Goodbye'
      click_button 'Update Post'
      expect(page).to have_content 'Goodbye'
      expect(page).not_to have_content 'Hello'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before { Post.create description: 'Sunday morning' }

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Edit'
      click_link 'Delete post'
      expect(page).not_to have_content 'Sunday morning'
      expect(page).to have_content 'Post deleted successfully'
    end

  end
end
