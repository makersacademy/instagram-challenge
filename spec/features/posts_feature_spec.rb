require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'flower')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('flower')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'editing posts' do
    before { Post.create name: 'flower' }

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit flower'
      fill_in 'Name', with: 'roses'
      click_button 'Update Post'
      expect(page).to have_content 'roses'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    before {Post.create name: 'flower'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete flower'
      expect(page).not_to have_content 'flower'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
