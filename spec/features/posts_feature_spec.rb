require 'rails_helper'

feature 'posts' do

  context 'Users own posts' do
    before(:each) do
      sign_up
    end

    scenario 'can post a new image' do
      post_image
      expect(page).to have_content 'Dig that hole'
      expect(Post.count).to eq 1
      expect(page).to have_content "Your post has been published"
    end

    scenario 'cannot post without image' do
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: 'hello'
      click_button 'Create Post'
      expect(page).to have_content 'Post failed'
      expect(Post.count).to eq 0
    end

    scenario 'can edit the post' do
      post_image
      visit "/posts/#{Post.first.id}"
      expect(page).to have_content 'Edit Post'
      click_link 'Edit Post'
      fill_in 'Caption', with: 'Hello'
      click_button 'Update Post'
      expect(page).to have_content 'Hello'
    end
  end

  context 'Other people\'s posts' do
    before(:each) do
      sign_up
      post_image
      click_link 'Logout'
      sign_up(username:'Hulk', email: 'Hulk@avengers.com')
    end

    scenario 'Cannot edit other user\'s post' do
      visit "/posts/#{Post.first.id}"
      expect(page).not_to have_link 'Edit Post'
      visit "/posts/#{Post.first.id}/edit"
      expect(page).to have_content "Cannot edit other user posts! Naughty user!"
    end
  end
end