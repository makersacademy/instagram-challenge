require 'rails_helper'

feature 'posts' do
  context 'no posts' do
    scenario 'should display a prompt to post an image' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post an image'
    end
  end
end
