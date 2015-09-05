require 'rails_helper'

feature 'posts' do
  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(text: 'Check out the hot new service CHRINSTAGRAM!!!')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Check out the hot new service CHRINSTAGRAM!!!')
      expect(page).not_to have_content('No posts yet')
    end
  end
end
