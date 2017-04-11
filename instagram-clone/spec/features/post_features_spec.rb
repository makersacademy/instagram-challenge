require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a link to add a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet!'
      expect(page).to have_link 'Upload a post'
    end
  end
end
