require 'rails_helper'

feature 'allows users to like posts' do

  before do
    Post.create(caption: 'Here is my post')
  end

  scenario 'likes are initially 0 when post is created' do
    sign_up
    visit '/posts'
    expect(page).to have_content('0 likes')
  end

  scenario 'a user can like a post, which increments the like count', js: true do
    sign_up
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('0 likes')
  end
end
