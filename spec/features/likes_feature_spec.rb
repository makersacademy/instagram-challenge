require 'rails_helper'

feature 'liking post' do
  before do
    sign_up
    add_post
    add_comment
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/posts'
    click_link 'image'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

  scenario 'a post gets multiple likes' do
    visit '/posts'
    click_link 'image'
    click_link 'Like'
    click_link 'Sign out'
    sign_up2
    visit '/posts'
    click_link 'image'
    click_link 'Like'
    expect(page).to have_content('2 Likes')
  end
  
end
