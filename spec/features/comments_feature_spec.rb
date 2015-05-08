require 'rails_helper'
require 'helpers/posts_helper_spec'
require 'helpers/comments_helper_spec'

feature 'comments' do

  include PostsHelper
  include CommentsHelper

  before do
    create_post('Awesome', 'This is awesome')
  end

  scenario 'allows users to leave a comment using a form' do
    create_comment('This is a comment')
    expect(page).to have_content('This is a comment')
    expect(current_path).to eq '/posts'
  end

  scenario 'all comments will be deleted if the post is deleted' do
    create_comment('This is a comment')
    click_link 'Delete post'
    expect(page).not_to have_content('This is a comment')
    expect(current_path).to eq '/posts'
  end
end