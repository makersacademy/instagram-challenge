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
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
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

    before do
      Post.create(description: 'Alpaca')
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    scenario 'can delete photos' do
      visit '/posts'
      click_link 'Delete Post'
      expect(page).not_to have_content 'Alpaca'
      expect(page).to have_content 'Post deleted successfully'
    end
  end

  context 'liking posts' do

    before {Post.create description: 'Like this post'}

    scenario 'likes can be added to a post' do
      sign_in_helper
      visit '/posts'
      expect(page).to have_content '0 Likes'
      click_button 'Like'
      expect(page).to have_content '1 Likes'
      expect(page).to have_content 'Post Liked!'
    end

    def sign_in_helper
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
  end
end