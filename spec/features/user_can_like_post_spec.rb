# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Like', type: :feature do
  scenario 'Can like a post' do
    sign_up
    create_post
    click_button 'Like'
    post = Post.find_by(description: "Cool pic")
    expect(page.find_by_id("post_#{post.id}")).to have_content('1 Like')
  end

  scenario 'Cannot like more than once' do
    sign_up
    create_post
    click_button 'Like'
    post = Post.find_by(description: "Cool pic")
    expect(page.find_by_id("post_#{post.id}")).not_to have_selector('Like')
  end
end
