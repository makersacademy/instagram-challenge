require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts yet.')
      expect(page).to have_content('Add a post!')
    end
  end
end
