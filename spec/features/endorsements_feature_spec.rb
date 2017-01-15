require 'rails_helper'
require 'web_helpers'

feature 'liking posts' do
  before do
    sign_up("test@gmail.com", "password")
    create_post("description")
    visit '/photographs'
    click_link 'Like post'
  end

  scenario 'a user can like a post, which updates the post endorsement count' do
    expect(page).to have_content('1 Like')
  end

  scenario 'another user can like a post, which updates the post endorsement count' do
    click_link 'Sign out'
    sign_up("test2@gmail.com", "password")
    visit '/photographs'
    click_link 'Like post'
    expect(page).to have_content('2 Likes')
  end

  scenario 'user can only like a post once' do
    click_link 'Like post'
    expect(page).to have_content('1 Like')
    expect(page).to have_content('You have already liked this post')
  end
end
