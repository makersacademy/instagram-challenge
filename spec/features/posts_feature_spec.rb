require 'rails_helper'

feature 'posts' do

  before do
    @user = create :user
    @user2 = create(:user, email: 'test2@example.com')
    sign_in(@user)
  end

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add post'
    end
  end

  context 'posts have been added' do
    before { Post.create description: 'My first instagram post' }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'My first instagram post'
      expect(page).not_to have_content 'No posts yet'
      end
  end

  context 'adding posts' do
    scenario 'prompts user to fill out form, then displays the new post' do
      visit '/posts'
      click_link 'Add post'
      fill_in 'Description', with: 'My first instagram post'
      click_button 'Create Post'
      expect(page).to have_content 'My first instagram post'
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do
    before { @user.posts.create description: 'My post' }

    scenario 'edits post upon clicking update edit post link' do
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Description', with: 'I\'ve now edited my post'
      click_button 'Update Post'
      expect(page).to have_content 'I\'ve now edited my post'
      expect(current_path).to eq '/posts'
    end

    scenario 'users can only edit their own posts' do
      click_link 'Sign out'
      sign_in(@user2)
      visit '/posts'
      expect(page).not_to have_link 'Edit post'
    end

    scenario 'cannot HTTP edit posts that are not theirs' do
      post = @user.posts.create description: 'My 2nd post'
      click_link 'Sign out'
      sign_in(@user2)
      visit "/posts/#{post.id}/edit"
      expect(page).to have_content "You cannot edit this post"
    end

  end

  context 'deleting posts' do
    before { @user.posts.create description: 'Delete this post' }

    scenario 'removes post upon clicking delete post link' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).to have_content 'Post deleted successfully'
      expect(page).not_to have_link 'Delete this post'
    end

    scenario 'users can only delete their own posts' do
      click_link 'Sign out'
      sign_in(@user2)
      visit '/posts'
      expect(page).not_to have_link 'Delete this post'
    end

  end







end
