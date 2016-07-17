require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a promt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'title')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('title')
    end
  end

end
