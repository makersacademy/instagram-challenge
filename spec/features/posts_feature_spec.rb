require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(description: 'My first instagram post')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content 'My first instagram post'
      expect(page).not_to have_content 'No posts yet'
      end
  end
end
