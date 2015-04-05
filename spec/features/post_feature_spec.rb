require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to Instantgram'
    end
  end

  context 'posting' do

    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit '/posts'
      click_link 'Post to Instantgram'
      attach_file 'Image', 'spec/marmite.jpeg'
      click_button 'Post'
    end

    scenario 'can post a new photo' do
      expect(page).to have_css("img[src*='marmite.jpeg']")
    end

    scenario 'can delete a post' do
      click_link 'Delete'
      expect(page).not_to have_css("img[src*='marmite.jpeg']")
      expect(page).to have_content('Post deleted successfully')
    end
  end

  context 'likes' do

    before do
      Post.create(description: 'Like this post')
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    scenario 'after being posted has 0 likes' do
      visit '/posts'
      expect(page).to have_content('0 Likes')
    end

    scenario 'can be liked' do
      visit '/posts'
      expect(page).to have_content('0 Likes')
      click_button 'Like'
      expect(page).to have_content('1 Likes')
      expect(page).to have_content('Liked!')
    end
  end

  context 'comments' do

    before do
      Post.create(description: 'Comment on this post')
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    scenario 'after being posted has no comments' do
      visit '/posts'
      expect(page).to have_content('No comments')
    end

    scenario 'can be commented' do
      visit '/posts'
      expect(page).to have_content('No comments')
      fill_in 'Text', with: 'This is a comment'
      click_button 'Comment'
      expect(page).to have_content('This is a comment')
    end
  end

end