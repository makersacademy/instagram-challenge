require 'rails_helper'
require 'web_helper'

feature 'liking posts' do

  it 'a user can endorse a review on the index page, which increments the endorsement count', js: true do
    create_user
    create_post
    sign_in
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end

  it 'a user can endorse a review on the view page, which increments the endorsement count', js: true do
    create_user
    create_post
    sign_in
    visit '/posts/1'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end

  scenario 'a post has no likes' do
    create_user
    create_post
    sign_in
    visit '/posts'
    expect(page).to have_content('0 likes')
  end

  scenario 'a review has one endorsement' do
    create_user
    post = Post.create(description: 'My lovely photo', user_id: 1, id: 1)
    post.likes.create
    sign_in
    visit '/posts'
    expect(page).to have_content('1 like')
end

end
