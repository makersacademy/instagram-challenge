require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet'
      expect(page).to have_link 'Add a post'
    end

  end

  context 'posts have been added' do
    before { Post.create description: 'Awesome latte' }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Awesome latte')
      expect(page).not_to have_content('There are no posts yet')
    end

  end

  context 'creating posts' do
    scenario 'prompts user to add content, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'Awesome latte'
      click_button 'Post'
      expect(page).to have_content 'Awesome latte'
      expect(current_path).to eq '/posts'
    end

  end

  context 'editing posts' do
    before { Post.create description: 'Awesome latte' }

    scenario 'lets a user edit a post description' do
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Description', with: 'Super latte'
      click_button 'Update Post'
      expect(page).to have_content 'Super latte'
      expect(current_path).to eq '/posts'
    end

  end

  context 'deleting posts' do
    before { Post.create description: 'Awesome latte' }

    scenario 'lets a user delete a post' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content 'Awesome latte'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end