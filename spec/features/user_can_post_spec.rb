# frozen_string_literal: true

require 'rails_helper'
require 'helpers/user_helpers.rb'
require 'helpers/post_helpers.rb'

RSpec.feature 'Create Post', type: :feature do
  scenario 'Can create a post' do
    sign_up
    click_on 'New Post'
    fill_in 'post_description', with: "Cool pic"
    attach_file("post_image", Rails.root + "spec/support/xxx.jpeg")
    click_button 'Create Post'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'can see username above picture' do
    visit '/'
    sign_up
    create_post
    post = Post.find_by(description: "Cool pic")
    expect(page.find_by_id("post_#{post.id}")).to have_content('Casper')
  end
end
