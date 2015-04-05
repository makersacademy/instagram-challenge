require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to Instagram'
    end
  end

  context 'creating posts' do

    scenario 'can post photos' do
      visit '/posts'
      click_link 'Post to Instagram'
      attach_file 'Image', 'spec/features/files/photo.jpg'
      fill_in 'Description', with: 'This is my first post'
      click_button 'Create Post'
      expect(page).to have_content 'This is my first post'
      expect(page).to have_css("img[src*='photo.jpg']")
    end
  end

  context 'deleting posts' do

    before {Post.create description: 'Alpaca'}

    scenario 'can delete posts' do
      visit '/posts'
      click_link 'Delete Alpaca'
      expect(page).not_to have_content 'Alpaca'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end