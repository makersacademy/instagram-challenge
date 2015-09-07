require 'rails_helper'

feature 'Posts' do
  context 'when no posts have been added' do
    it 'shows users link to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts have been added')
      expect(page).to have_link('Add a post')
    end
  end
end
