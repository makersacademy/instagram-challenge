require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do 

    scenario 'should display a prompt to create a new post' do
      visit '/posts'
      expect(page).to have_content 'No posts...'
      expect(page).to have_link 'Create a post!'
    end
  end

  context 'posts have been added' do

    before do
      Post.create(title: 'My bass guitar')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My bass guitar')
      expect(page).not_to have_content ('No posts..')
    end
  end

  context 'creating posts' do

    scenario 'user creates a post' do
      visit '/posts'
      click_link 'Create a post!'
      fill_in 'Title', with: 'My bass guitar'
      attach_file 'Image', 'spec/test-images/bass.jpeg'
      click_button 'Post!'
      expect(page).to have_content 'My bass guitar'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before do
      Post.create(title: 'My bass guitar')
    end

    scenario 'removes a post when user click a delete link' do
      visit '/posts'
      click_link 'Delete Post'
      expect(page).to have_content "Post 'My bass guitar' deleted"
    end

  end

end