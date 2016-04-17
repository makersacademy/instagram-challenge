require 'rails_helper'

feature 'liking posts' do
  before do
    firstpost = Post.create(description: 'First post')
  end

  scenario 'a user can like a post, which updates the post like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

end