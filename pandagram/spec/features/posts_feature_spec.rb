require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'new post' do
    scenario 'user can add a post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Post', with: 'First Post'
      click_button 'Add'
      expect(page).to have_content 'First post'
      expect(page).not_to have_content 'No posts yet'
    end
  end
end
