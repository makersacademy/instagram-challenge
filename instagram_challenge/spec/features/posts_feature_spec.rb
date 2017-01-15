require 'rails_helper'

feature 'posts' do

  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: 'The snow looks great')
    end

    scenario 'display restaurants' do
      visit '/posts'
      expect(page).to have_content('The snow looks great')
      expect(page).not_to have_content('No posts yet')
    end
  end
end
