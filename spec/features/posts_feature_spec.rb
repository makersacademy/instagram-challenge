require 'rails_helper'

feature 'Posts' do
  context 'when no posts have been added' do
    it 'shows users link to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts have been added')
      expect(page).to have_link('Add a post')
    end
  end

  context 'when posts have been created' do
    before do
      Post.create(caption: '#life')
    end

    scenario 'displays posts' do
      visit '/posts'
      expect(page).to have_content('#life')
      expect(page).not_to have_content('No posts have been added')
    end
  end
end
