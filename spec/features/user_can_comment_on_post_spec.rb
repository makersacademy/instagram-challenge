# frozen_string_literal: true

require 'rails_helper'
require 'helpers/user_helpers.rb'
require 'helpers/post_helpers.rb'

RSpec.feature 'Comment', type: :feature do
  scenario 'Can add comment' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Dumbo'
    fill_in 'user_email', with: 'bye@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'
    click_on 'Add Comment'
    fill_in 'comment_body', with: 'hello'
    click_button 'Create Comment'
    comment = Comment.find_by(body: "hello")
    expect(page.find_by_id("comment_#{comment.id}")).to have_content('hello')
  end

  scenario 'user can see comment author' do
    sign_up
    create_post
    click_on 'Logout'
    click_on 'Sign up'
    fill_in 'user_username', with: 'Dumbo'
    fill_in 'user_email', with: 'bye@world.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'
    click_on 'Add Comment'
    fill_in 'comment_body', with: 'hello'
    click_button 'Create Comment'
    comment = Comment.find_by(body: "hello")
    expect(page.find_by_id("comment_#{comment.id}")).to have_content('Dumbo')
  end
end
