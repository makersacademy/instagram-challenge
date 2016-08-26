require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'displays a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New post'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'New post'
      fill_in 'Title', with: 'First post'
      click_button 'Create Post'
      expect(page).to have_content 'First post'
      expect(current_path).to eq '/posts'
    end
end

end
