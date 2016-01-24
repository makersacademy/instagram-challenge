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
      Post.create(comment: 'My first post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My first post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'post[comment]', with: 'My Fave Breakfast!'
      click_button 'Create Post'
      expect(page).to have_content 'My Fave Breakfast!'
      expect(current_path).to eq '/posts'
    end
  end
end
