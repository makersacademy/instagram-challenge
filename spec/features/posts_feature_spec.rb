require 'rails_helper'

feature 'posts' do
  context 'when no posts have been added' do
    scenario 'displays a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'Looks like there are no posts yet...'
    end

    scenario 'displays a link to create a post' do
      visit '/posts'
      expect(page).to have_link 'Post a photo'
    end
  end
end
