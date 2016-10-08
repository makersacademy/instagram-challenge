require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
    scenario 'should display posts' do
      Post.create(name: "Test post", content: "Test content")
      visit '/posts'
      expect(page).to have_content 'Test post'
      expect(page).to have_content 'Test content'
    end
  end
end
