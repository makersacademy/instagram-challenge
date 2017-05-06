require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display prompt add a post' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
end
