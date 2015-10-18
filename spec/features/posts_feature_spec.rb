require 'rails_helper'

feature 'posts' do
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
    before { Post.create description: 'KFC' }

    scenario 'user can edit posts' do
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Description', with: 'I\'ve now edited my post'
      click_button 'Update Post'
      expect(page).to have_content 'I\'ve now edited my post'
      expect(current_path).to eq '/posts'
    end
  end






end
