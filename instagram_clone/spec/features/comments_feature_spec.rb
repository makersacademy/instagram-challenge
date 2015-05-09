require 'rails_helper'

feature 'Leaving a comment' do
  scenario 'allows users to leave a comment' do
    post = Post.create(content: 'its a post')
    sign_up
    visit '/posts'
    click_link "post ##{post.id}"
    click_link "comment on post"
    fill_in :Thoughts, with: "Yeah buddy!!!"
    click_button 'leave comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content "Yeah buddy!!!"
  end

  scenario 'doesnt allow visitors to comment' do
    post = Post.create(content: 'its a post')
    visit '/posts'
    click_link "post ##{post.id}"
    click_link "comment on post"
    expect(page).to have_content 'You need to sign in or sign up before continuing.'

  end

  scenario 'when parent post is destroyed, child comments are destroyed as well' do
    post = Post.create(content: 'its a post')
    sign_up
    visit '/posts'
    click_link "post ##{post.id}"
    click_link "comment on post"
    fill_in :Thoughts, with: "Yeah buddy!!!"
    click_button 'leave comment'
    click_link "post ##{post.id}"
    click_link "delete post"
    expect(page).not_to have_content("Yeah buddy!!!")
  end

  scenario 'A comment can be deleted' do
    post = Post.create(content: 'its a post')
    sign_up
    visit '/posts'
    click_link "post ##{post.id}"
    click_link "comment on post"
    fill_in :Thoughts, with: "Yeah buddy!!!"
    click_button 'leave comment'
    click_link "post ##{post.id}"
    click_link "delete comment"
    expect(current_path).to eq '/posts'
    expect(page).to have_content('comment deleted successfully')
    click_link "post ##{post.id}"
    expect(page).not_to have_content("Yeah buddy!!!")
  end
end