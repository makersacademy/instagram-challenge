require 'rails_helper'

feature 'posts' do
  context 'user has no posts added' do
    scenario 'should display no posts' do
      sign_up
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end

    scenario 'can display a post' do
      sign_up
      new_post
      expect(page).to have_content 'this is a description'
    end

    scenario 'can display two posts' do
      sign_up
      new_post
      new_post(description: 'second description')
      expect(page).to have_content 'this is a description'
      expect(page).to have_content 'second description'
    end
  end
  context 'user has two posts added' do
    before do
      sign_up
      new_post
      new_post(description: 'second description')
    end
    scenario 'a signed out user can see posts' do
      sign_out
      visit '/posts'
      expect(page).to have_content 'this is a description'
      expect(page).to have_content 'second description'
    end
  end
end
