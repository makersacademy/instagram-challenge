require 'rails_helper'

feature 'comments' do
  context 'no comments' do
    scenario 'should display no posts and an option to add a post' do
      Post.create(name: "Test post", content: "Test content")
      visit '/posts'
      expect(page).to have_content 'No comments'
      expect(page).to have_link 'Leave comment'
    end
    scenario 'should save posts' do
      Post.create(name: "Test post", content: "Test content")
      visit '/posts'
      click_link 'Leave comment'
      fill_in 'Content', with: 'Test comment 123'
      click_button 'Add'
      expect(page).to have_content 'Test comment 123'
    end
  end
end
