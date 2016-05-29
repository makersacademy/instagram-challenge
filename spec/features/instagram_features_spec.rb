require 'rails_helper'

feature 'instagram' do
  context 'no posts should have been added' do
    scenario 'should display a promp to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
  context 'posts have been added' do
    before do
      Post.create(title: 'Insta-lunch')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Insta-lunch')
      expect(page).not_to have_content('No posts')
    end
  end
end
