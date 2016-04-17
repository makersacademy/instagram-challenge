require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to make a new a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'restaurants have been added' do
  before do
    Post.create(description: "First post")
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('First post')
    expect(page).not_to have_content('No posts yet')
  end
end
end