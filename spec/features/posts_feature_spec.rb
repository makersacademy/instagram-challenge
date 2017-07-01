require 'rails_helper'

feature 'posts' do
  context 'no posts available' do
    scenario 'should display a link to add a post' do
      visit ('/')
      expect(page).to have_content('No posts available')
      expect(page).to have_content('Add Post')
    end
  end
end
