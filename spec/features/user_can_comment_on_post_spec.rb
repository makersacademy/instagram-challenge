# frozen_string_literal: true

require 'rails_helper'
require 'helpers/web_helpers.rb'

RSpec.feature 'Comment', type: :feature do
  scenario 'Can add comment' do
    sign_up
    create_post
    click_on 'Logout'
    sign_up2
    create_comment
    comment = Comment.find_by(body: "hello")
    expect(page.find_by_id("comment_#{comment.id}")).to have_content('hello')
  end

  scenario 'user can see comment author' do
    sign_up
    create_post
    click_on 'Logout'
    sign_up2
    create_comment
    comment = Comment.find_by(body: "hello")
    expect(page.find_by_id("comment_#{comment.id}")).to have_content('Dumbo')
  end

  scenario 'user can see comments count' do
    sign_up
    create_post
    click_on 'Logout'
    sign_up2
    create_comment
    post = Post.find_by(description: "Cool pic")
    expect(page.find_by_id("post_#{post.id}")).to have_content('1 Comment')
  end
end
