require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do 
    scenario 'should display a prompt to create a new post' do
      visit '/posts'
      expect(page).to have_content 'No posts...'
      expect(page).to have_link 'Create a post!'
    end
  end

  context 'posts have been added' do

    before do
      Post.create(name: 'Holidays')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Holidays')
      expect(page).not_to have_content ('No posts..')
    end

  end
end