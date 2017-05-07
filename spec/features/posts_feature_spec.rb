require 'rails_helper'

feature 'posts' do
  context 'no posts have been created' do
    scenario 'should display a prompt to create a post' do
      visit root_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create post'
    end
  end

  context 'post has been added' do
    before do
      
    end
  end
end
