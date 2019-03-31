require 'rails_helper'
require 'features_helper'

feature 'Posts:' do

  before(:all) do
    Dir.mkdir 'public/posts' unless File.directory?('public/posts')
  end
  
  scenario 'can submit posts' do
    sign_up_for_an_account
    post_an_image
    expect(page).to have_css '.image_post'
  end

  scenario 'can delete posts' do
    sign_up_for_an_account
    post_an_image
    click_button 'Delete'
    expect(page).not_to have_css '.image_post'
  end

  scenario 'can see the date and time for a post' do
    sign_up_for_an_account
    post_an_image
    expect(page).to have_content 'Posted on:'
  end

  scenario 'a user can like a post (once only)' do
    sign_up_for_an_account
    post_an_image
    click_button 'Like'
    expect(page).to have_content 'Likes: 1'
    click_button 'Like'
    expect(page).to have_content 'Likes: 1'
  end

  scenario 'a user can un-like a post (once only)' do
    sign_up_for_an_account
    post_an_image
    click_button 'Like'
    expect(page).to have_content 'Likes: 1'
    click_button 'Un-like'
    expect(page).to have_content 'Likes: 0'
  end

  scenario 'a post can be seen on its own page' do
    sign_up_for_an_account
    post_an_image
    click_link 'Post detail'
    expect(page).to have_css '.post'
  end
end