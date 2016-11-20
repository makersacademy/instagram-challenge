require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(description: 'I have posted this thing')
    end

    scenario 'display post' do
      visit '/posts'
      expect(page).to have_content('I have posted this thing')
      expect(page).not_to have_content('No posts yet')
    end
  end
end
