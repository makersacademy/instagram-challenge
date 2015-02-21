require 'rails_helper'

feature 'posts' do
  context 'there are zero posts' do
    scenario 'should display a message for adding a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts'
      expect(page).to have_link 'Create a post'
    end
  end
end