require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to upload a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post to instagram'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Post to instagram'
      fill_in 'Caption', with: 'My first post'
      click_button 'Create Post'
      expect(page).to have_content 'My first post'
      expect(current_path).to eq '/posts'
    end
  end
end
