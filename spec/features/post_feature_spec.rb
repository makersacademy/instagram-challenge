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
    before do
      Post.create(caption: 'Birthday')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content ('Birthday')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating posts' do
    scenario 'promts a user to add a post then displays the post' do
      visit '/posts'
      sign_up
      click_link 'Add a post'
      # attach_file('post[image]', Rails.root + 'spec/features/support/test_image.jpg')
      fill_in 'Caption', with: 'Birthday'
      click_button 'Create Post'
      expect(page).to have_content 'Birthday'
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do

    before do
      Post.create caption: 'Birthday'
    end

    scenario 'let a user edit a post' do
      visit '/posts'
      sign_up
      click_link 'Edit Birthday'
      fill_in 'Caption', with: 'Birthday party'
      click_button 'Update Post'
      expect(page).to have_content 'Birthday party'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before do
       Post.create caption: 'Birthday'
    end

    scenario 'removes a post when user clicks delete post' do
      visit '/posts'
      sign_up
      click_link 'Delete post'
      expect(page).not_to have_content 'Birthday'
      expect(page).to have_content 'Post deleted!'
    end
  end

end
