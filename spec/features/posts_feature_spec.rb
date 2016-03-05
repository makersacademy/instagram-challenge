require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    scenario 'display posts' do
      post = FactoryGirl.create(:post)
      visit '/posts'
      expect(page).to have_content(post.description)
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'adding posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'This is the description'
      attach_file 'post[image]', Rails.root.join('spec','images','bbc-g.jpg')
      click_button 'Create Post'
      expect(page).to have_content 'This is the description'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing a post' do
    scenario 'lets a user view a post' do
       post = FactoryGirl.create(:post)
       visit '/posts'
       click_link 'More'
       expect(page).to have_content post.description
       expect(current_path).to eq "/posts/#{post.id}"
    end
  end

  context 'editing posts' do
    scenario 'let a user edit a post' do
      post = FactoryGirl.create(:post)
      visit '/posts'
      click_link 'Edit'
      fill_in 'Description', with: 'A new description'
      click_button 'Update Post'
      expect(page).to have_content 'A new description'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks a delete link' do
      post = FactoryGirl.create(:post)
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content post.description
      expect(page).to have_content 'Post deleted successfully'
    end
  end

end
