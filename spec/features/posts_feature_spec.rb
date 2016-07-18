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
      Post.create(caption: 'picture')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('picture')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'picture'
      click_button 'Create Post'
      expect(page).to have_content 'picture'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:picture){ Post.create(caption:'picture') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'picture'
      expect(page).to have_content 'picture'
      expect(current_path).to eq "/posts/#{picture.id}"
    end
  end

  context 'editing posts' do

    before { Post.create caption: 'picture'}

    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit picture'
      fill_in 'post_caption', with: 'holiday snap'
      click_button 'Update Post'
      expect(page).to have_content 'holiday snap'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    before { Post.create caption: 'picture'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete picture'
      expect(page).not_to have_content 'picture'
      expect(page).to have_content 'post deleted successfully'
    end
  end
end













