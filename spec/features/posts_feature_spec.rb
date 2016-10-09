require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add'
    end
    scenario 'should display posts' do
      Post.create(name: "Test post", content: "Test content")
      visit '/posts'
      expect(page).to have_content 'Test post'
      expect(page).to have_content 'Test content'
    end
    scenario 'should allow to create new posts' do
      visit 'posts'
      click_link 'Add'
      fill_in 'Name', with: 'Test name'
      fill_in 'Content', with: 'Test content'
      click_button 'Add'
      expect(page).to have_content 'Test name'
      expect(page).to have_content 'Test content'
    end
    scenario 'should accept pictures and display them' do
      visit 'posts'
      click_link 'Add'
      fill_in 'Name', with: 'Test name'
      fill_in 'Content', with: 'Test content'
      attach_file("post_image", Rails.root + "spec/fixtures/test.png")
      click_button 'Add'
      expect(page).to have_css("img[src*='test.png']")
    end
  end
end
