require 'rails_helper'

feature 'posts' do
  context 'there have been no posts' do
    scenario 'should display a prompt to submit a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Submit a post'
    end
  end
end
