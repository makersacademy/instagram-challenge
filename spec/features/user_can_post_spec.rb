# frozen_string_literal: true

require 'rails_helper'
require 'helpers/web_helpers.rb'

RSpec.feature 'Create Post', type: :feature do
  scenario 'Can create a post' do
    sign_up
    create_post
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'can see username above picture' do
    sign_up
    create_post
    post = Post.find_by(description: "Cool pic")
    expect(page.find_by_id("post_#{post.id}")).to have_content('Casper')
  end
end
