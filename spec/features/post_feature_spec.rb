require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a promt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'title')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('title')
    end
  end

  context 'creating posts and viewing them on the index page'  do
    scenario 'prompts user to fill out form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Something'
      attach_file('post_image', Rails.root + 'spec/fixtures/test_image.png')
      click_button 'Create Post'
      expect(page).to have_content 'Something'
      expect(page).to have_selector 'img'
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts title' do
    before do
      Post.create(title: 'title')
    end

  scenario 'let a user edit post title' do
    visit '/posts'
    click_link 'Edit'
    fill_in 'Title', with: 'Something else'
    click_button 'Update Post'
    expect(page).to have_content 'Something else'
    expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before { Post.create title: 'Title'}

    scenario 'removes a post when a user clicks' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Title'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end
