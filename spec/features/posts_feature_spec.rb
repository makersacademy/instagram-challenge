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
      Post.create(caption: 'Here is a test post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Here is a test post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Here is a test post'
      click_button 'Create Post'
      expect(page).to have_content 'Here is a test post'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:testpost){Post.create(caption:'Here is a test post')}

    scenario 'lets a user view a post' do
     visit '/posts'
     click_link 'Here is a test post'
     expect(page).to have_content 'Here is a test post'
     expect(current_path).to eq "/posts/#{testpost.id}"
    end
  end

  context 'editing posts' do
    before { Post.create caption: 'Here is a test post' }

    scenario 'let a user edit a post' do
     visit '/posts'
     click_link 'Edit post'
     fill_in 'Caption', with: 'A differently worded test post'
     click_button 'Update Post'
     expect(page).to have_content 'A differently worded test post'
     expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    before {Post.create caption: 'Here is a test post'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content 'Here is a test post'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
